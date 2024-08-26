#!/bin/bash
files=$(ls -a $1 | grep -E '^.[^.]+')
# 去掉 ls -a 返回结果中的 ". .. .git and xxxx.xxxx"
for file in `echo $files`; do
	cat $1/$file > ~/$file
done
