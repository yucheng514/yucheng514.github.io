---
title: All About Webpack
date: 2021-05-12 16:40:48
tags:
---
### path
```
path: path.resolve(__dirname, 'dist')
```
path.join()
path.resolve() 方法将路径或路径片段的序列解析为绝对路径。
详见 <http://nodejs.cn/api/path/path_resolve_paths.html >
__dirname 详见 <http://nodejs.cn/api/modules/dirname.html >

### Webpack 优化策略
1. 优化 loader 配置
- 优化正则匹配
- 通过 cacheDirectory 选项开启缓存
- 通过 include、exclude 来减少被处理的文件

```
module: {
  rules: [
    {
      test: /\.js$/,
      loader: 'babel-loader?cacheDirectory',
      include: [resolve('src')]
    }
  ]
}
```

2. 比较实用的方法: 
- 按需加载，优化 loader 配置，关闭生产环境的sourceMap，CDN优化。
- vue-cli 已做的优化： 代码压缩，提取公共代码，再优化空间不大。
- 根据项目实际需要和自身开发水平选择优化方法，必须避免因为优化产生 bug

<https://juejin.cn/post/6844904004825120782 >
<https://segmentfault.com/a/1190000021693432 >