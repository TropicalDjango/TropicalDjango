#!/usr/bin/python
import sys
# sys.argv = ['test.py, arg1, arg2'];

def typing():
    f = open("README.md","w")
    f.write("# CMPUT XXX:\n## Assignment X: (XXX)\nBy: JOE SMITH\n### File Structure:\n")
    tree = input("")
    f.write(tree + "\n### Design Decisions\n### Running Instructions")
    f.close()

if __name__ == "__main__":
    typing()
    exit()
