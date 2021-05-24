---
title: Vue 2.x 响应式原理
date: 2021-05-25 03:05:47
tags:
---

<center>
    <img style="border-radius: 0.3125em;box-shadow: 0 2px 4px 0 rgba(34,36,38,.12),0 2px 10px 0 rgba(34,36,38,.08);" src="https://raw.githubusercontent.com/daluozha/MyPostImage/master/mini-vue2.png">
    <div style="color:orange; border-bottom: 1px solid #d9d9d9;display: inline-block;color: #999;padding: 2px;">Vue 2.x 响应式原理图1</div>
</center>

### new Vue( ) 做了什么？

- new Vue之后，在init中会对传入的options中data的每个数据都进行observe。这个observe会使用object.defineProperty来对数据进行getter，setter重写在实例vm下。注意，observe并没有直接改动data，而是将里面的数据做了一份副本放在了实例下，相当于提升了一个层级
- observe中会new Dep，这是一个依赖追踪，当get的时候如果Dep.target（这是一个全局变量）不为null时触发dep.depend()  收集依赖；在set的时候触发dep.notify()  依赖触发
- observe之后的某个环节（可能是mount），会对挂载的#app下所有dom建立watcher实例，new的过程中首先会将Dep.target设置成this，然后运行一次update（这里会首先触发this.get()来触发observe，让observe的get把当前的依赖收集到dep的subs里面），结束的时候设置成null
- 双向绑定完成，现在改变input的value或者data的数据都会实时更新另一边（实际上watcher都会触发，只是有一个是已更新的又赋值了一次）

<center>
    <img style="border-radius: 0.3125em;box-shadow: 0 2px 4px 0 rgba(34,36,38,.12),0 2px 10px 0 rgba(34,36,38,.08);" src="https://raw.githubusercontent.com/daluozha/MyPostImage/master/mini-vue.jpeg">
    <div style="color:orange; border-bottom: 1px solid #d9d9d9;display: inline-block;color: #999;padding: 2px;">Vue 2.x 响应式原理图2</div>
</center>


### 代码参考
- 实现一个 mini-vue : <https://github.com/daluozha/RENEKTOY/tree/main/handwriting/mini-vue>