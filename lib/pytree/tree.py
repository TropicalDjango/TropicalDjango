#!/usr/bin/env python3
# cli.py

import argparse
import pathlib
import sys

from __init__ import __version__
from pytree import DirectoryTree

def parse_cmd_line_arguments():
    parser = argparse.ArgumentParser(
            prog="tree",
            description="Tree, a directory tree generator",
            epilog="Thanks for using Tree",
    )
    parser.version = f"Tree v{__version__}"
    parser.add_argument("-v","--version",action="version")
    parser.add_argument(
            "root_dir",
            metavar="ROOT_DIR",
            nargs="?",
            default=".",
            help="generate a full directory tree starting at ROOT_DIR",
    )
    parser.add_argument(
            "-d",
            "--dir-only",
            action="store_true",
            help="Generate a directory-only tree",
    )
    parser.add_argument(
            "-V",
            "--vis-only",
            action="store_true",
            help="Generate a tree with no hidden files or directories",
    )
    return parser.parse_args()

if __name__ == "__main__":
    args = parse_cmd_line_arguments()
    root_dir = pathlib.Path(args.root_dir)
    if not root_dir.is_dir():
        print("The specified root directory doesn't exist")
        sys.exit()
    tree = DirectoryTree(root_dir, dir_only=args.dir_only,vis_only=args.vis_only)
    tree.generate()

