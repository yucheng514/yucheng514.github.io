---
title: 【JS框架】Vue.js
date: 2020-03-19 01:04:51
tags:
---

## Vue.js
官方文档<https://cn.vuejs.org/ >

1. 组件 component

  - 全局调用

    - ```vue
        Vue.component('todoitem1', {
        	props:['content'],
            template: "<li>这是组件的全局调用</li>"
        })
      ```

    - 在挂载点直接使用 \<todoitem1\> 标签
  
  	- ```
        <todoitem1 v-for="(item,index) of list" :key="index" :content="item">
        </todoitem1>
        
        ```
  
        
  
  - 局部调用
  
    - ```
    var todoitem2={
          template:'<li>这是局部调用</li>'
      }
      ```
  	- 使用 \<todoitem2\> 之前要在 Vue( ) 里做一个声明
    - ```
var daluozha = new Vue({
        el: "#daluozha",
        components:{
        'todoitem2':todoitem2,
  }
      ```
  
2. 组件与实例的关系

   - Vue( ) 是一个 Vue 的实例，没有定义 template 的话，模板就是挂载点，即 daluozha 类的 div
   - 每一个 Vue.component 也都是一个 Vue 的实例，可以写上 methods、computed
   - 最外层的 Vue( ) 实例是父组件，里面的 Vue.component 即为子组件。通过标签属性的形式给子组件传递了内容，而子组件通过 props 接收，完成值的传递。
   - 子组件可以通过 this.$emit(del,this.index) 自定义事件，父组件模板的标签监听 del 事件： @del=“handelDel”，将子组件的事件送回父组件的 methods 里的 handleDel 函数进行处理。

3. this.$set( )
   - 当生成vue实例后，当再次给数据赋值时，有时候并不会自动更新到视图上去； 当我们去看vue文档的时候，会发现有这么一句话：如果在实例创建之后添加新的属性到实例上，它不会触发视图更新。 如下代码，给 student对象新增 age 属性
   ```
    data () { 
      return { 
          student: { 
          name: '', 
          sex: '' 
          } 
      } 
    } 
    mounted () { 
      // ——钩子函数，实例挂载之后 
      this.student.age = 24 
    }
   ```
   - 受 ES5 的限制，Vue.js 不能检测到对象属性的添加或删除。因为Vue.js 在初始化实例时将属性转为 getter/setter，所以属性必须在data 对象上才能让 Vue.js 转换它，才能让它是响应的。正确写法：this.$set(this.data,”key”,value')
   ```
    mounted () {
      this.$set(this.student,"age", 24)
    }
   ```