#!/usr/bin/env python3
# -*- coding: utf8 -*-


import argparse
import sys


def main():
    ap = argparse.ArgumentParser(description="")
    ap.add_argument("somefile", nargs='?', help="...")
    ap.add_argument("-d", "--dry-run", action="store_true", help="dry run")
    args = ap.parse_args()


if __name__ == '__main__':
    sys.exit(main())
