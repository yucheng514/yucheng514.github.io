---
title: FE 基础知识
date: 2020-06-11 01:30:47
tags:
---
## HTML 文档加载过程

<https://www.jianshu.com/p/16435ba1b32e >

## 事件模型

<https://www.jianshu.com/p/dcee13943ede >
<https://segmentfault.com/a/1190000018977590 >

## 浏览器的回流与重绘

<https://juejin.cn/post/6844903569087266823 >

##  URI 和 URL 的区别

<https://www.zhihu.com/question/21950864 >

## 原型链

<https://juejin.cn/post/6844903989088092174 >
<https://www.seozen.top/javascript-object-prototypes-chain.html >

## ES6 模块与 CommonJS 模块的差异

<https://wangdoc.com/es6/module-loader.html >

## 什么是跨域？解决跨域的办法有哪些？

<https://www.bilibili.com/video/BV1nb411P7tQ?p=14&t=61.4 >

## npm yarn cnpm pnpm
<https://blog.csdn.net/qq_32614411/article/details/80894605 >

## 事件循环(Event Loop)

- 一开始整个脚本作为一个宏任务执行
- 执行过程中同步代码直接执行，宏任务进入宏任务队列，微任务进入微任务队列
- 当前宏任务执行完出队，检查微任务列表，有则依次执行，直到全部执行完
- 执行浏览器 UI 线程的渲染工作
- 检查是否有 Web Worker 任务，有则执行
- 执行完本轮的宏任务，回到2，依此循环，直到宏任务和微任务队列都为空
  
微任务包括：MutationObserver、Promise.then() 或 catch()、Promise 为基础开发的其它技术，比如 fetch API、V8 的垃圾回收过程、Node 独有的 process.nextTick。

宏任务包括：script 、setTimeout、setInterval 、setImmediate 、I/O 、UI rendering。

在所有任务开始的时候，由于宏任务中包括了 script，所以浏览器会先执行一个宏任务，在这个过程中你看到的延迟任务(例如 setTimeout )将被放到下一轮宏任务中来执行。

参考<https://github.com/i-want-offer/questions_collection/blob/master/promise%E9%A2%98%E7%9B%AE/45%E9%81%93Promise%E9%A2%98%E7%9B%AE.md >


## 从输入 URL 到页面加载完成的过程中都发生了什么事情
1. DNS 解析：域名地址 -> IP (依次读取浏览器、系统、路由器、网络运营商的 DNS 缓存)
   解析过程：递归搜索 **.** -> **.com.** -> **.google.com.** -> **www.google.com.**
   相关概念：DNS 优化、DNS 缓存、DNS 负载均衡
2. TCP 连接 (TCP 三次握手)
3. 发送 HTTP 请求
   - 请求报文：HTTP 协议的请求报文
4. 服务器处理请求
   - 响应报文
5. 浏览器渲染页面
   1. 遇见 HTML 标记，浏览器调用 HTML 解析器解析成 Token 并构建成 dom 树
   2. 遇见 style/link 标记，浏览器调用 css 解析器，处理 css 标记并构建 cssom 树
   3. 遇见 script 标记，调用 javascript 解析器，处理 script 代码（绑定事件，修改 dom 树/ cssom 树）
   4. 将 dom 树和 cssom 树合并成一个渲染树
   5. 根据渲染树来计算布局，计算每个节点的几何信息（布局
   6. 将各个节点颜色绘制到屏幕上（渲染
6. 断开连接 (TCP 四次挥手)

【注意】前五个步骤不一定按照顺序执行，如果 dom 树或 cssom 树被修改了，可能会执行多次布局和渲染。往往在实际页面中，这前五个步骤都会执行多次。

## TCP 三次握手 & 四次挥手

- 三次握手
  1. 客户端发送连接请求到服务端
  2. 服务端返回确认
  3. 客户端发送确认连接


- 四次挥手（可参考<https://www.bilibili.com/video/BV1nb411P7tQ?p=16&t=974.7 >
  1. 客户端 A 发送连接关闭 A -> B 到服务端 B
  2. 服务端返回确认
  3. 服务端发送连接关闭 B -> A 到客户端
  4. 客户端发送确认，服务端收到就关闭，客户端等待一段时间也关闭

   

### 手写题

- 手写instanceof
- 实现数组的map方法
- reduce实现数组的map方法
- 手写数组的reduce方法
- 数组扁平化
- 函数柯里化
- 浅拷贝实现
- 深拷贝实现
- 手写call/apply/bind
- 手动实现new
- 手写promise(常考promise.all, promise.race))
- 手写原生AJAX
- 手写节流防抖函数
- 手写Promise加载图片
- 实现事件订阅发布(eventBus)

<https://daijl.cn/51568/ >
<https://daijl.cn/39558/ >