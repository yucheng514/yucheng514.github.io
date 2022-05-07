---
title: 如何在 vite 中批量导入模块
date: 2022-05-05 23:33:42
tags:
---
之前批量导入用的是

```
require.context(directory, useSubdirectories = false, regExp = /^\.\//)
```

一共接收三个参数：1.传入搜索的目录 2.一个Boolean值，表示是否加载子目录 3.一个正则表达式

但在 vite 中不支持使用 require，故改用 **import.meta.glob** 和 **import.meta.globEager**

> import.meta.glob 为过动态导入，构建时，会分离为独立的 chunk
> import.meta.globEager 为直接引入

参考：
- <https://zhuanlan.zhihu.com/p/443175985 >

- <https://juejin.cn/post/6951557699079569422 >