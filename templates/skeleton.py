#! /usr/bin/env nix-shell
#! nix-shell -i python3.7 -p python37 python37Packages.yaml

"""
Says hello!
"""

import argparse
import sys

def main(argv=()):
    cmdline = argparser()
    args = cmdline.parse_args(argv)
    if args.shout:
        print("HELLO!")
    else:
        print("hello")

def argparser():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--shout",
        action="store_true",
        help="Very loud hello"
    )
    return parser

if __name__ == "__main__":
    main(argv = sys.argv[1:])
