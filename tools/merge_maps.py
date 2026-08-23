#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Streamer.bot / Speaker.bot 多语言映射生成与校验管线。

用法（在仓库根目录执行）:
  校验仓库内全部映射（键集一致性 / 占位符完整性 / 编码）:
    python tools/merge_maps.py validate

  查看各映射统计（总数 / 已译 / 保留英文 / 抑制）:
    python tools/merge_maps.py stats

  以 zh-CN 为权威键源，合并部分译文生成新语言映射（缺失条目回退英文）:
    python tools/merge_maps.py merge --app Streamer.bot --lang fr-FR --translations fr.tsv

映射文件格式: UTF-8 无 BOM，首行表头 `# english<TAB>语言代码`，
之后每行 `英文<TAB>译文`。
译文与原文相同 = 该条保留英文；译文为空 = 抑制该条（不翻译）。
zh-CN 映射是权威键源：所有语言的键集合必须与它完全一致。
"""
import argparse
import io
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
LANGS = ['zh-CN', 'ja-JP', 'ko-KR', 'es-ES']
APPS = ['Streamer.bot', 'Speaker.bot']
PLACEHOLDER_RE = re.compile(r'\{\d\}|%[A-Za-z0-9_.\-]+%')

if hasattr(sys.stdout, 'reconfigure'):
    sys.stdout.reconfigure(encoding='utf-8', errors='replace')


def map_path(app, lang):
    return os.path.join(ROOT, app, lang, 'ZhMap.tsv')


def read_map(path):
    """读取映射文件 -> (表头, 有序键值表, 错误列表)。"""
    header = None
    entries = {}
    order = []
    errors = []
    with io.open(path, 'r', encoding='utf-8-sig') as f:
        for i, raw in enumerate(f):
            line = raw.rstrip('\r\n')
            if i == 0:
                header = line
                if not line.startswith('#'):
                    errors.append('第 1 行不是表头: %r' % line[:50])
                continue
            if not line.strip():
                continue
            if '\t' not in line:
                errors.append('第 %d 行缺少 TAB: %r' % (i + 1, line[:40]))
                continue
            key, _, val = line.partition('\t')
            key = key.strip()
            val = val.strip()
            if not key:
                errors.append('第 %d 行键为空' % (i + 1))
                continue
            if key in entries:
                errors.append('第 %d 行重复键: %r' % (i + 1, key[:40]))
                continue
            entries[key] = val
            order.append(key)
    return header, entries, order, errors


def placeholders(s):
    return PLACEHOLDER_RE.findall(s or '')


def classify(entries):
    """统计: 已译 / 保留英文 / 抑制。"""
    translated = kept = suppressed = 0
    for k, v in entries.items():
        if v == '':
            suppressed += 1
        elif v == k:
            kept += 1
        else:
            translated += 1
    return translated, kept, suppressed


def check_placeholders(key, val):
    """返回该条目的占位符问题列表（键里有而译文缺失的）。"""
    missing = []
    for ph in placeholders(key):
        if ph not in (val or ''):
            missing.append(ph)
    return missing


def cmd_validate(_args):
    failed = False
    for app in APPS:
        zh_path = map_path(app, 'zh-CN')
        zh_header, zh, zh_order, zh_errors = read_map(zh_path)
        print('=' * 60)
        print('%s (权威键源: zh-CN, %d 键)' % (app, len(zh)))
        for e in zh_errors:
            print('  [zh-CN] 错误: %s' % e)
            failed = True
        for lang in LANGS:
            if lang == 'zh-CN':
                continue
            path = map_path(app, lang)
            header, entries, order, errors = read_map(path)
            for e in errors:
                print('  [%s] 错误: %s' % (lang, e))
                failed = True
            missing = [k for k in zh_order if k not in entries]
            extra = [k for k in order if k not in zh]
            ph_bad = []
            for k, v in entries.items():
                for ph in check_placeholders(k, v):
                    ph_bad.append((k, ph))
            translated, kept, suppressed = classify(entries)
            status = 'PASS' if not (missing or extra or ph_bad or errors) else 'FAIL'
            if status == 'FAIL':
                failed = True
            print('  [%s] %s: %d 键 | 已译 %d / 保留英文 %d / 抑制 %d | 缺键 %d | 多键 %d | 占位符错误 %d'
                  % (lang, status, len(entries), translated, kept, suppressed,
                     len(missing), len(extra), len(ph_bad)))
            for k in missing[:5]:
                print('    缺键示例: %r' % k[:50])
            for k in extra[:5]:
                print('    多键示例: %r' % k[:50])
            for k, ph in ph_bad[:5]:
                print('    占位符缺失: %r 缺 %s' % (k[:40], ph))
    print('=' * 60)
    print('总体结果: %s' % ('FAIL' if failed else 'PASS'))
    return 1 if failed else 0


def cmd_stats(_args):
    for app in APPS:
        print('%s' % app)
        for lang in LANGS:
            path = map_path(app, lang)
            if not os.path.exists(path):
                print('  [%s] 文件不存在: %s' % (lang, path))
                continue
            _h, entries, _o, errors = read_map(path)
            translated, kept, suppressed = classify(entries)
            print('  [%s] %d 键 | 已译 %d / 保留英文 %d / 抑制 %d | 解析错误 %d'
                  % (lang, len(entries), translated, kept, suppressed, len(errors)))
    return 0


def cmd_merge(args):
    src = args.source or map_path(args.app, 'zh-CN')
    out = args.out or map_path(args.app, args.lang)
    if not os.path.exists(src):
        print('错误: 权威键源不存在: %s' % src)
        return 1
    zh_header, zh, zh_order, zh_errors = read_map(src)
    if zh_errors:
        for e in zh_errors:
            print('权威键源错误: %s' % e)
        return 1

    trans = {}
    if args.translations:
        if not os.path.exists(args.translations):
            print('错误: 译文文件不存在: %s' % args.translations)
            return 1
        _th, trans, _to, t_errors = read_map(args.translations)
        for e in t_errors:
            print('译文文件警告: %s' % e)
        extra = [k for k in trans if k not in zh]
        if extra:
            print('警告: %d 条译文键不在权威键源中（已忽略），示例: %r'
                  % (len(extra), extra[0][:40]))

    lines = ['# english\t%s' % args.lang]
    translated = kept = 0
    fallbacks = []
    for key in zh_order:
        val = trans.get(key)
        if val is None or val == '':
            # 缺失译文 -> 回退保留英文
            lines.append('%s\t%s' % (key, key))
            kept += 1
            if val is None and trans:
                fallbacks.append(key)
            continue
        bad = check_placeholders(key, val)
        if bad:
            # 占位符不完整 -> 回退保留英文，避免破坏格式串
            print('警告: %r 译文缺少占位符 %s，已回退英文' % (key[:40], ','.join(bad)))
            lines.append('%s\t%s' % (key, key))
            kept += 1
            continue
        lines.append('%s\t%s' % (key, val))
        translated += 1

    os.makedirs(os.path.dirname(out), exist_ok=True)
    with io.open(out, 'w', encoding='utf-8', newline='\n') as f:
        f.write('\n'.join(lines) + '\n')
    print('已生成: %s' % out)
    print('共 %d 键 | 已译 %d / 回退英文 %d' % (len(zh_order), translated, kept))
    if fallbacks:
        print('（其中 %d 条无译文回退，示例: %r）' % (len(fallbacks), fallbacks[0][:40]))
    return 0


def main():
    parser = argparse.ArgumentParser(description='多语言映射生成与校验管线')
    sub = parser.add_subparsers(dest='cmd')
    sub.add_parser('validate', help='校验仓库内全部映射')
    sub.add_parser('stats', help='查看各映射统计')
    m = sub.add_parser('merge', help='合并部分译文生成新语言映射')
    m.add_argument('--app', required=True, choices=APPS)
    m.add_argument('--lang', required=True, help='目标语言代码，如 fr-FR')
    m.add_argument('--translations', help='部分译文 TSV（英文<TAB>译文），缺失条目回退英文')
    m.add_argument('--source', help='权威键源映射（默认 zh-CN）')
    m.add_argument('--out', help='输出路径（默认仓库内该语言目录）')
    args = parser.parse_args()
    if args.cmd == 'validate':
        return cmd_validate(args)
    if args.cmd == 'stats':
        return cmd_stats(args)
    if args.cmd == 'merge':
        return cmd_merge(args)
    parser.print_help()
    return 0


if __name__ == '__main__':
    sys.exit(main())
