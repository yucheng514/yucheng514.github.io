---
title: Vue 2.x 响应式原理
date: 2021-05-25 03:05:47
tags: Vuejs
---

<center>
    <img style="border-radius: 0.3125em;box-shadow: 0 2px 4px 0 rgba(34,36,38,.12),0 2px 10px 0 rgba(34,36,38,.08);" src="https://raw.githubusercontent.com/daluozha/MyPostImage/master/mini-vue2.png">
    <div style="color:orange; border-bottom: 1px solid #d9d9d9;display: inline-block;color: #999;padding: 2px;">Vue 2.x 响应式原理图1</div>
</center>

### new Vue( ) 做了什么？

- new Vue 之后，在 init 中会对传入的 options 中 data 的每个数据都进行 observe。这个 observe 会使用 object.defineProperty 来对数据进行 getter，setter 重写，然后放在实例vm下。注意，observe 并没有直接改动 data，而是将里面的数据做了一份副本放在了实例下，相当于提升了一个层级。
- observe中会new Dep，这是一个依赖追踪，当get的时候如果全局变量Dep.target不为null时触发dep.depend()  收集依赖；在set的时候触发dep.notify()  依赖触发。
- observe 之后的某个环节（可能是 mount ），会对挂载的 #app 下所有 dom 建立 watcher 实例，new 的过程中首先会将 Dep.target 设置成 this，然后运行一次 update（这里会首先触发 this.get() 来触发 observe，让 observe 的 get 把当前的依赖收集到 dep 的subs 里面），结束的时候设置成 null。
- 双向绑定完成，现在改变 input 的 value 或者 data 的数据都会实时更新另一边，实际上 watcher 都会触发，只是有一个是已更新的又赋值了一次。

<center>
    <img style="border-radius: 0.3125em;box-shadow: 0 2px 4px 0 rgba(34,36,38,.12),0 2px 10px 0 rgba(34,36,38,.08);" src="https://raw.githubusercontent.com/daluozha/MyPostImage/master/mini-vue.jpeg">
    <div style="color:orange; border-bottom: 1px solid #d9d9d9;display: inline-block;color: #999;padding: 2px;">Vue 2.x 响应式原理图2</div>
</center>


### 代码参考
- 实现一个 mini-vue : <https://github.com/daluozha/RENEKTOY/tree/main/handwriting/mini-vue>