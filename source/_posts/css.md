---
title: 【学习笔记】层叠样式表 CSS
date: 2018-07-24 18:18:29
tags:
---

### CSS Position

Position 是 CSS 中一个非常重要的属性，它的作用是将元素在网页中定位。设定值分别为：static、absolute、relative、fixed、sticky。

1. **static** HTML 里面所有元素的 position 默认值都是 static 。static 会跟随 HTML 排版的流程( flow )移动而且不受偏移量 left、right、top、bottom 的影响
2. **absolute** 元素会固定在所设定的位置，不会跟随 HTML 排版的流程移动。但如果 absolute 元素所在的容器有滚动条的话，它就会随着滚动而移动。
   - 如果将 absolute 元素加入到 absolute 元素里面，里面的元素就会根据外面的元素的位置去定位。
3. **relative** 与 static 很相似，都会跟随 HTML 的排版流程移动，而它比 static 多了 top、left、right、bottom 的设定。即是它跟随 HTML 排版流程去定位之余，还可以透过偏移量去调整位置。
   - relative 最重要的一个功能是：在它里面的 absolute 元素会根据 relative 的位置去定位。改成static 则不行，absolute 元素会完全无视 static 的，即使它在 static 里面。
   - relative 与 static 比较，主要增加了两大功能：
     - 具备偏移量的设定
     - 可以让 absolute 子元素根据它的位置来定位
4. **fixed** 与 absolute 很相似，不同的地方有：
   - fixed 会定位到屏幕中的固定位置，即使滚动页面也会一直保持在那个位置。
   - 如果 fixed 元素设定了偏移量，即使放在 relative 里面，fixed 还是会根据页面，即 body 去定位，而不会根据 relative 去定位
5. **sticky** 当设置" top:0 "的时候，滚动页面直至 sticky 贴到顶部，sticky 就会固定在顶部。

### 元素置中对齐
- 左右居中
  1. display 属性是 inline 或 inline-block 的时候，将父元素（容器）使用 **text-align:center**
  2. display 属性是 block 的时候， 将元素本身的 **margin-left** 与 **margin-right** 设定为 **auto**
- 上下左右居中
  1.  position: absolute
     - top: 50%; left: 50%; transform: translateX(-50%) translateY(-50%);
     - right: 50%; bottom: 50%; transform: translateX(50%) translateY(-50%);
  2.  Flexbox
     - min-height: 100vh; display: flex; justify-content: center; align-items: center; 
  3.  Display Table
     - display: table-cell; vertical-align: middle;

### Flex 布局
- Flex Container 
  1. flex-direction: row,column,row-reverse,column-reverse 。当 row 时，main-axis（主轴）就是 row 、cross-axis（交叉轴）是 column。
  2. justify-content & align-items: 设定主轴 & 交叉轴的排序方向。有 center、flex-start、flex-end
  3. flex-wrap: 设定flex-items是否分行。有 nowrap、wrap
  4. flex-flow = flex-direction + flex-wrap
  5. align-content: 当 flex-wrap为 wrap 并且有多于一行的 flex-items 时，设定行与行之间的对齐方式。有flex-start、flex-end、center、space-around（左右都有相同的空间隔开）、space-evenly（之间有相同的间距）、space-between（之间有相同间距，但是取消最左和最右的空间）。
- Flex Item
  1. order: 调整 flex-items 的排序位置，预设值为0，根据 order 由小到大排列。注意：flex-items 在 HTML 内的位置并不代表最终显示的位置，因为 order 可以随意将个别 flex-item 的位置改变。
  2. align-self: 用于覆写 flex-container 的 align-items 设定。
  3. flex-basis: 设定 flex-item 主轴方向上的大小。在设定 flex-basis 之后，原有的宽度或者高度设定就会失效，改为按照 flex-basis 的设定值去计算。设定为 0 则等同于 width 是 0 的效果，只要容器本身没有 overflow:hidden 的设定，即等于它的大小取决于内容的大小。设定为 auto 则代表按照本身原有宽度或者高度的大小去计算
  4. flex-grow: 当 flex-container 主轴方向有剩余空间的时候，flex-item 沿主轴方向扩大的设定。设定为数值，是 flex-item 占几份的意思，分母是剩余空间的大小；0表示保持原有的大小不扩大。
  5. flex-shrink: 与 flex-grow 相反，是指 flex-item 主轴方向的大小总和超出了 flex-container 的时候，flex-item 沿主轴方向怎样缩小的设定。设定为数值，表示各自分担几份被缩小的空间，分母是超出空间的大小；0表示不缩小。
  6. flex = ( flex-grow + flex-shrink + flex-basis )
 - 感谢 Coding Startup 🤗



### Grid 布局
- Flexbox 属于一维的排版方式，一个 Flexbox 容器只能控制一个方向，即水平或垂直方向，如果需要控制另一方向则需要再添加一层 Flexbox 容器。而 Grid 属于二维的排版方式，Grid 容器则可以同时控制两个方向，这样就可以直接定义容器内元素的位置。
- 
