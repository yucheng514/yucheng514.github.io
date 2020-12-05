---
title: 【学习笔记】JavaScript
date: 2018-03-28 19:45:40
tags:
---
### JavaScript
   - JS 数据类型
      - 五种可包含值的数据类型：
         - 字符串（string）
         - 数字（number）
         - 布尔（boolean）
         - 对象（object）
         - 函数（function）
      - 三种对象类型：
         - 对象（Object）
         - 日期（Date）
         - 数组（Array）
      - 两种不能包含值的数据类型：
         - null
         - undefined
      - 注意：
         - NaN 的数据类型是数值
         - 数组的数据类型是对象
         - 日期的数据类型是对象
         - null 的数据类型是对象
         - 未定义变量的数据类型是 undefined
         - 尚未赋值的变量的数据类型也是 undefined
         - 无法使用 typeof 去判断 JavaScript 对象是否是数组（或日期），但可以用 constructor 属性返回所有 JavaScript 变量的构造器函数
   - Undefined 与 Null 的区别
      - null 和 undefined 的值相等，但类型不等
      - ```
         typeof undefined              // undefined
         typeof null                   // object
         null === undefined            // false
         null == undefined             // true
        ```
   - 布尔值 true & false
      - 所有具有“真实”值的即为 True ，包括任何（非空）字符串、字符串 'false' 、任何表达式（除了零）
      - 所有不具有“真实”值的即为 False ，包括0、-0、""(空值)、undefined、null、false、NaN

   - 箭头函数
      - 箭头函数允许使用简短的语法来编写函数表达式，不需要 function 关键字、return 关键字和花括号。
      - ```
         // ES5
         var x = function(x, y) {
         return x * y;
         }

         // ES6
         const x = (x, y) => x * y;
        ```
   - Call & Apply
      - JavaScript call( ) 方法 可带参数
         - call( ) 方法是预定义的 JavaScript 方法。它可以用来调用所有者对象作为参数的方法。通过 call( ) 能够使用属于另一个对象的方法。
         - ```
            var person = {
            fullName: function(city, country) {
               return this.firstName + " " + this.lastName + "," + city + "," + country;
            }
            }
            var person1 = {
            firstName:"Bill",
            lastName: "Gates"
            }
            person.fullName.call(person1, "Seattle", "USA");
           ```
      - JavaScript apply( ) 方法
         - apply( ) 方法与 call( ) 方法不带参数的时候非常相似。 不同之处是call( ) 方法分别接受参数。apply( ) 方法接受数组形式的参数。如果要使用数组而不是参数列表，则 apply( ) 方法非常方便。    
         - ```
            var person = {
            fullName: function(city, country) {
               return this.firstName + " " + this.lastName + "," + city + "," + country;
            }
            }
            var person1 = {
            firstName:"John",
            lastName: "Doe"
            }
            person.fullName.apply(person1, ["Oslo", "Norway"]);
           ```
   - 闭包
      - 闭包是什么：<https://www.ruanyifeng.com/blog/2009/08/learning_javascript_closures.html>
      - ```
         var add = (function () {
            var counter = 0;
            return function () {return counter += 1;}
         })();

         add();
         add();
         add();

         // 计数器目前是 3 
        ```
   - 周期性调度方法
   1. 
   ```
      let timerId = setInverval(()=>alert('tick'),2000)   
   ```
   2. 下一次调用在前一次调用完成时再调度
   ```
   let timerId = setTimeout(function tick(){
      alert('tick')
      timerId = setTimeout(tick,2000)
   },2000)
   ```


### 新增的数组方法
   - forEach
   ```
   [].forEach(function(value, index, array) {
      // ...
   });
   ```

   - map
   > 这里的map不是“地图”的意思，而是指“映射”，就是原数组被“映射”成对应新数组（返回值

   ```
   var data = [1, 2, 3, 4];
   var arrayOfSquares = data.map(function (item) {
      return item * item;
   });
   alert(arrayOfSquares); // 1, 4, 9, 16
   ```
   - filter
   > filter为“过滤”、“筛选”之意。指数组filter后，返回过滤后的新数组。
   > filter的callback函数需要返回布尔值true或false. 如果为true则表示，恭喜你，通过啦！如果为false, 只能高歌“我只能无情地将你抛弃……”

   ```
   var data = [-1, 0, 1, 2, 3];
   var arrayFilter = data.filter(function(item) {
      return item;
   });
   console.log(arrayFilter); // [1, 2, 3] 
   ```

   - some & every
   > some意指“某些”，指是否“某些项”合乎条件。与下面的every算是好基友，every表示是否“每一项”都要靠谱。

### 逻辑或 & 逻辑与
   - 由axml的如下代码发掘出： 
   ```
   {{tab == 1 && 'active'}}
   ```

   - 逻辑或（||）总结：只要第一个值的布尔值为 false，那么永远返回第二个值。逻辑或属于短路操作，第一个值为 true 时，不再操作第二个值，且返回第一个值。

   - 逻辑与（&&）总结：只要第一个值的布尔值为 true，那么永远返回第二个值。逻辑与属于短路操作，第一个值为 false 时，不再操作第二个值，且返回第一个值。

### 事件类型
   - JavaScript可以处理的事件类型为：鼠标类型、键盘类型和HTML类型！注意：所有的事件处理函数都由两个部分组成，on+事件名称。例如：click事件，处理函数就是onclick！

第一种：鼠标事件。

click：单击鼠标按钮时触发；

dblclick：当用户双击主鼠标按钮时触发；

mousedown：当用户按下鼠标还未弹起时触发；

mouseup：当用户释放鼠标按钮时触发；

mouseover：当鼠标移到某个元素上方时触发；

mouseout：当鼠标移出某个元素上方时触发；

mousemove：当鼠标指针在元素上移动时触发；

mouseenter：在鼠标光标从元素外部首次移动至元素范围内触发，不参与冒泡；

mouseleave：鼠标移出；

第二种：键盘事件。

keydown：当用户按下键盘上任意键时触发，如果按住不放，会重复触发；

keyup：当用户释放键盘上的键触发；

keypress：当用户按下键盘上的字符键时触发，如果按住不放，会重复触发；

第三种：HTML事件。

load：当页面完全加载后在window上面触发，或当框架集加载完毕后在框架集上触发；

unload：当页面完全卸载后在window上面触发，或当框架集卸载后在框架集上触发；

select：当用户选择文本框（input或textarea）中的一个或多个字符触发；

change：当文本框（input或textarea）内容改变且失去焦点后触发；

input：输入；

focus：当页面或者元素获得焦点时在window及相关元素上面触发；

blur：当页面或元素失去焦点时在window及相关元素上触发；

submit：当用户点击提交按钮在<form>元素上触发；

reset：当用户点击重置按钮在<form>元素上触发；

resize：当窗口或框架的大小变化时在window或框架上触发；

scroll：当用户滚动带滚动条的元素时触发；

以上就是这三种事件类型，千万记住事件之前要加“on”。