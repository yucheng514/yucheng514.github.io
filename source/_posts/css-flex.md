---
title: Flex 布局
date: 2020-05-24 16:30:29
tags: CSS
---

<!-- 前言： -->

### Flex Container 
  1. flex-direction: row,column,row-reverse,column-reverse 。当 row 时，main-axis（主轴）就是 row 、cross-axis（交叉轴）是 column。
  2. justify-content & align-items: 设定主轴 & 交叉轴的排序方向。有 center、flex-start、flex-end
  3. flex-wrap: 设定flex-items是否分行。有 nowrap、wrap
  4. flex-flow = flex-direction + flex-wrap
  5. align-content: 当 flex-wrap为 wrap 并且有多于一行的 flex-items 时，设定行与行之间的对齐方式。有flex-start、flex-end、center、space-around（左右都有相同的空间隔开）、space-evenly（之间有相同的间距）、space-between（之间有相同间距，但是取消最左和最右的空间）。

### Flex Item
  1. order: 调整 flex-items 的排序位置，预设值为0，根据 order 由小到大排列。注意：flex-items 在 HTML 内的位置并不代表最终显示的位置，因为 order 可以随意将个别 flex-item 的位置改变。
  2. align-self: 用于覆写 flex-container 的 align-items 设定。
  3. flex-basis: 设定 flex-item 主轴方向上的大小。在设定 flex-basis 之后，原有的宽度或者高度设定就会失效，改为按照 flex-basis 的设定值去计算。设定为 0 则等同于 width 是 0 的效果，只要容器本身没有 overflow:hidden 的设定，即等于它的大小取决于内容的大小。设定为 auto 则代表按照本身原有宽度或者高度的大小去计算
  4. flex-grow: 当 flex-container 主轴方向有剩余空间的时候，flex-item 沿主轴方向扩大的设定。设定为数值，是 flex-item 占几份的意思，分母是剩余空间的大小；0表示保持原有的大小不扩大。
  5. flex-shrink: 与 flex-grow 相反，是指 flex-item 主轴方向的大小总和超出了 flex-container 的时候，flex-item 沿主轴方向怎样缩小的设定。设定为数值，表示各自分担几份被缩小的空间，分母是超出空间的大小；0表示不缩小。
  6. flex = ( flex-grow + flex-shrink + flex-basis )

### 本文参考 <https://www.bilibili.com/video/BV1qJ411N7TA> ，感谢 Coding Startup 🤗

