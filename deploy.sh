#!/usr/bin/env sh

# 当发生错误时中止脚本
set -e

# 加载 nvm 
export NVM_DIR="$HOME/.nvm" 
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm 

# 指定 node 版本
nvm use 

# 构建
hexo clean

hexo g

# 部署
hexo d

cd -