# pytree.py

"""This module provides Tree main module"""

import os
import pathlib

PIPE =  "│"
ELBOW = "└──"
TEE = "├──"
PIPE_PREFIX = "│  "
SPACE_PREFIX = "   "

GREEN = "\u001b[32m"
RED = "\u001b[31m"
BLUE = "\u001b[34m"
YELLOW = "\u001b[33m"

class DirectoryTree:
    def __init__(self, root_dir, dir_only=False, vis_only=False):
        self._generator = _TreeGenerator(root_dir, dir_only, vis_only)

    def generate(self):
        tree = self._generator.bulid_tree()
        for entry in tree:
            print(entry)

class _TreeGenerator:
    def __init__(self, root_dir, dir_only=False, vis_only=False):
        self._root_dir = pathlib.Path(root_dir)
        self._tree = []
        self._dir_only = dir_only
        self._vis_only = vis_only

    def bulid_tree(self):
        self._tree_head()
        self._tree_body(self._root_dir, vis_only=self._vis_only)
        return self._tree
    
    def _tree_head(self):
        self._tree.append(YELLOW + f"{self._root_dir}{os.sep}")
        self._tree.append(PIPE)

    def _tree_body(self, directory, prefix="", vis_only=False):
        entries = self._prepare_entries(directory)
        entries_count = len(entries)
        for index, entry in enumerate(entries):
            connector = ELBOW if index == entries_count -1 else TEE
            if entry.is_dir():
                connector= GREEN + ELBOW
                self._add_directory(
                        entry, index, entries_count, prefix, connector
                        )
            else :
                connector = RED + ELBOW
                self._add_file(entry, prefix, connector)

    def _add_directory(
            self, directory, index, entries_count, prefix, connector
    ):
        self._tree.append(f"{prefix}{connector} {directory.name}{os.sep}")
        if index != entries_count - 1:
            prefix += PIPE_PREFIX
        else:
            prefix += SPACE_PREFIX
        self._tree_body(
                directory=directory,
                prefix=prefix,
                )
        self._tree.append(prefix.rstrip())

    def _add_file(self, file, prefix, connector):
        self._tree.append(f"{prefix}{connector}{file.name}")

    def _prepare_entries(self, directory):
        entries = directory.iterdir()
        if  self._dir_only:
            entries = [entry for entry in entries if entry.is_dir()]
        if self._vis_only:
            entires = [entry for entry in entries if not pathlib.Path(entry).match('*')]
        entries = sorted(entries, key=lambda entry: entry.is_file())
        return entries


