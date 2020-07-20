---
title: 【学习笔记】Git
date: 2019-05-21 01:17:26
tags:
---

### 分支获取另一分支的更新
以xxx分支获取master的更新为例：
1. git checkout master
2. git pull
3. git checkout xxx（自己的分支
4. git merge master
5. git push origin xxx

### Ambiguous 警告
跟v1.1.0合并的时候遇到了:

> warning: refname 'v1.1.0' is ambiguous.
> Switched to branch 'v1.1.0'


- 原因：branch 跟 tag 有重名

- 解决方案：改掉本地的分支名
```
    git branch -m v1.1.0 local_v1.1.0
```

- 相关 git 命令：
```
    git branch -m 旧分支名 新分支名 
    //重命名

    git branch -M 旧分支名 新分支名
    //如果新分支名已存在，进行强制覆盖

    git branch -D 分支名
    //删除
```

### git revert 和 git reset 的区别 
- git revert 是用一次新的 commit 来回滚之前的 commit，git reset 是直接删除指定的 commit。
- 在回滚这一操作上看，效果差不多。但是在日后继续merge以前的老版本时有区别。因为git revert是用一次逆向的commit“中和”之前的提交，因此日后合并老的branch时，导致这部分改变不会再次出现，但是git reset是之间把某些commit在某个branch上删除，因而和老的branch再次merge时，这些被回滚的commit应该还会被引入。 
- git reset 是把HEAD向后移动了一下，而git revert是HEAD继续前进，只是新的commit的内容和要revert的内容正好相反，能够抵消要被revert的内容。

### 分支命令
Git鼓励大量使用分支：
- 查看分支：git branch
- 创建分支：git branch \<name>
- 切换分支：git checkout \<name> 或者 git switch \<name>
- 创建+切换分支：git checkout -b \<name> 或者 git switch -c \<name>
- 合并某分支到当前分支：git merge \<name>
- 删除分支：git branch -d \<name>
- 分支追踪：git branch -vv

### 获取远程分支到本地
1. 在本地新建分支 x，并自动切换到该本地分支 x。
   ```
    git checkout -b 本地分支名x origin/远程分支名x
   ```
2. 在本地新建分支 x，但是不会自动切换到该本地分支 x，需要手动 checkout。
   ```
    git fetch origin 远程分支名x:本地分支名x
   ```

### 设定 upstream
- -u 等同于 --set-upstream
- 例子：
   ```
    git push -u origin feature/pre_release_batch_tool_20200702
   ```
  
### git stash
- git stash
- git stash list
- git stash pop
- git stash apply
- git stash show -p


### 一些命令
- git更新

**git pull origin master**


- git上传

1. **git add .**

2. **git commit -m "  "**

3. **git push origin master**
   

- git终端

**CTRL+C** 中断

**CTRL+D** 退出

