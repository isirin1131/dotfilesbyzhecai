 #!/bin/bash
 files=$(ls -a $1 | grep -E '^\.[^\.]+' |grep -v .git)
 # 去掉 ls -a 返回结果中的 ". .. .git and xxxx.xxxx"
 for file in `echo $files`; do
     ln $1/$file ~/$file # 创建 hard 链接
 done
