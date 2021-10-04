#!/usr/bin/env python3

import os
import subprocess

DOCS_PATH="."
DOXYGEN_SRC_PATH="source"

def gen_doxygen_xml():
	print("doxygen is generating xml ...")
	saved_dir = os.getcwd()
	doxygen_src_path = os.path.join(os.path.abspath(saved_dir), DOXYGEN_SRC_PATH)
	os.chdir(doxygen_src_path)
	p = subprocess.Popen("doxygen")
	os.chdir(saved_dir)
	ret = p.wait()
	print(f"doxygen generates xml finished ret={ret}")

def gen_sphinx_html():
	print(f"sphinx is generating html ...")
	p = subprocess.Popen("make html", shell=True)
	ret = p.wait()
	print(f"sphinx generates html finished, ret={ret}")

def clean_tmp_files():
	print("clean temp files ...")
	p = subprocess.Popen("rm -r build/doctrees", shell=True)
	ret = p.wait()
	p = subprocess.Popen("rm -r source/html", shell=True)
	ret = p.wait()
	p = subprocess.Popen("rm -r source/latex", shell=True)
	ret = p.wait()
	p = subprocess.Popen("rm -r source/xml", shell=True)

def main():
	gen_doxygen_xml()
	gen_sphinx_html()
	clean_tmp_files()

if __name__ == "__main__":
	main()
