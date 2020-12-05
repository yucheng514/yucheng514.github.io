---
title: 【学习笔记】Q & A
date: 2020-05-21 01:03:17
tags:
---
### 隐藏文本但保留 css 样式
- 描述：目的是垫高上面的标签，不会因为下面的标签 if 判断隐藏之后掉下来
- A：用 text-indent（首行缩进的作用）将文本移除：
```
.hide-text {
  overflow: hidden;
  text-indent: 100%;
  white-space: nowrap;
}
```



### for 循环指定 index 删除数组元素

- 描述：for in/for of/forEach 都不行，因为删除一个后数组就会更新 index，使得大的 index 就会向前更新变小。
- A：使用逆序遍历，反着来删除：
```
for (let i = delIndex.length - 1; i >= 0; i--) {
  this.$delete(items , delIndex[i])
}
```



### 文字过长显示省略号

- 描述：
  1. 设置不换行和过多隐藏。
  2. 设置块状元素（block 或者 inline-block）
  
- A：
```
.over-flow{ 
  text-overflow:ellipsis;
  max-width:450rpx; 
  white-space:nowrap; 
  overflow:hidden; 
  display:inline-block;
  vertical-align:middle;
}
```
- 新增：
```
//最多一行显示
.maxline-1 {
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 1;//显示的文本的行数
    -webkit-box-orient: vertical;//规定框的子元素应该被水平或垂直排列
    word-break: break-all
}

//最多两行显示
.maxline-2 {
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    word-break: break-all
}
```

### icon 只在边际地方点击触发
- 描述：用于删除的 icon 点击正中心没反应，只在边际地方能触发

- A：后面的元素设置了 position:relative 导致它们之间产生了堆叠上下文。加上它们的 z-index 都是 auto，使得后面的元素自动覆盖在 icon 上面，因此点不到正中心。
```
.item-delete{
  ...
  /* z-index:auto 会导致 item-delete 被后面的覆盖，点击不了 */
  z-index: 1;
}
```
### 在条件语句中直接判断

描述：如果 x 是 undefine , null , false , " " , 0 或 NaN ,它将保持不变
```
var o={};
if(o.x) o.x+=1;  
```

### 将数组中某个元素放在首位
```
let values = [1, 3, 5, 7, 12, 10];
let value = 12;  //需要置于首位的元素
let index = values.indexOf(12);
if(index) {
      let first = values.splice(index , 1)[0];
      values.unshift(first);
 }
 console.log(values);
 //输出 [12, 1, 3, 5, 7, 10 ]
 ```
