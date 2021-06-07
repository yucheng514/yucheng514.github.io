---
title: react
date: 2021-06-07 23:49:05
tags: Reactjs
toc: true
---

# React.js

在学习 React 的过程中，记录了一些相关的笔记和知识点

代码参考：<https://github.com/daluozha/BEEMO >

## React 的一些特点

- 声名式开发(对应：命令式开发)
- 可以与其他框架并存(只控制了指定挂载的 div 标签的渲染)
- 组件化
- 单向数据流
- 视图层框架(大型数据通信需要借助别的框架)
- 函数式编程(方便自动化测试)


## React 数据视图更新原理

1. state 数据
2. JSX 模板
3. 数据 + 模板 生成虚拟 DOM (虚拟 DOM 就是一个 JS 对象，用它来描述真实的 DOM)，损耗了少许性能，获得['div', {id: 'abc'}, ['span', {}, 'hello world']]
4. 用虚拟 DOM 的结构生成真实的 DOM，来显示 `<div id='abc'><span>hello world</span></div>`
5. state 发生变化
6. 数据 + 模板生成新的虚拟DOM（相比直接更换真实DOM，极大的提升了性能）['div', {id: 'abc'}, ['span', {}, 'bye bye']]
7. 比较原始虚拟 DOM 和新的虚拟 DOM 的区别，找到区别是 span 中的内容
8. 直接操作 DOM，改变 span 中的内容


## Redux 工作流程

<center>
    <img style="border-radius: 0.3125em;box-shadow: 0 2px 4px 0 rgba(34,36,38,.12),0 2px 10px 0 rgba(34,36,38,.08);" src="https://raw.githubusercontent.com/daluozha/MyPostImage/master/Redux-Flow.png">
    <div style="color:orange; border-bottom: 1px solid #d9d9d9;display: inline-block;color: #999;padding: 2px;">Redux Flow</div>
</center>

## Redux 设计和使用的三项原则

1. store 必须是唯一的
2. 只有 store 能改变自己的内容，Reducer 应该深拷贝一份 state 修改完毕之后再 return 这份 state
3. Reducer 必须是纯函数(纯函数指的是：给定固定的输入，就一定会有固定的输出，而且不会有任何的副作用)

## Redux 的核心 API

- createStore
- store.dispatch
- store.getState
- store.subscribe