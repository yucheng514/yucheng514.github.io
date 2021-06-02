---
title: 千牛小程序实现表格
date: 2020-05-16 01:01:18
tags: CSS

---

### 小程序文档 

- <https://opendocs.alipay.com/mini/framework >
- 商家应用开发文档 <https://miniapp.open.taobao.com/docV3.htm?docId=117323&docType=1&qq-pf-to=pcqq.temporaryc2c&tag=dev >

- 小程序的核心是一个响应式的数据绑定系统，分为视图层和逻辑层。这两层始终保持同步，只要在逻辑层修改数据，视图层就会相应的更新。
- 关掉自动刷新，重新进入页面的时候，在不重新编译的情况下，axml 文件改动过的内容能生效（包括页面的 &#123; &#123; &#125; &#125; js 代码），js 文件的不能生效。


### 实现表格的两种 css 方式

#### flex布局

axml：

```html
<view id="panel" class="flex-column">
  <view class="flex-cell flex-row">
    <text class="flex-cell flex-row">1</text>
    <text class="flex-cell flex-row">2</text>
    <text class="flex-cell flex-row">3</text>
    <text class="flex-cell flex-row">4</text>
  </view>
  <view class="flex-row flex-cell">
    <text class="flex-cell flex-row">1</text>
    <text class="flex-cell flex-row">2</text>
    <text class="flex-cell flex-row">3</text>
    <text class="flex-cell flex-row">4</text>
  </view>
  <view class="flex-row flex-cell">
    <text class="flex-cell flex-row">1</text>
    <text class="flex-cell flex-row">2</text>
    <text class="flex-cell flex-row">3</text>
    <text class="flex-cell flex-row">4</text>
  </view>
  <view class="flex-row flex-cell">
    <text class="flex-cell flex-row">1</text>
    <text class="flex-cell flex-row">2</text>
    <text class="flex-cell flex-row">3</text>
    <text class="flex-cell flex-row">4</text>
  </view>
  <view class="flex-row flex-cell">
    <text class="flex-cell flex-row">1</text>
    <text class="flex-cell flex-row">2</text>
    <text class="flex-cell flex-row">3</text>
    <text class="flex-cell flex-row">4</text>
  </view>
</view>
```

acss：

```css
#panel{
  height:65vh;
  background:#fff;
}
#panel text{
  line-height: 13vh;
  border-right: 1rpx solid #ddd;
  border-bottom: 1rpx solid #ddd;
}
.flex-row{
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
}
.flex-column{
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: stretch;
}
.flex-cell{
  flex: 1;
}
```

效果：

![](https://gitee.com/daluozha/luozha/raw/master/img/20200721004006.png)

#### table

axml：

```HTML
<view class="table">
    <view class="table-tr">
        <view class="table-th">省份/直辖市</view>
        <view class="table-th">GDP</view>
        <view class="table-th">增长率</view>
    </view>
    <view class="table-tr">
        <view class="table-td">广东</view>
        <view class="table-td">72812456</view>
        <view class="table-td">8.0%</view>
    </view>
    <view class="table-tr">
        <view class="table-td">河南</view>
        <view class="table-td">37010</view>
        <view class="table-td">8.3%</view>
    </view>
    <view class="table-tr">
        <view class="table-td">江苏</view>
        <view class="table-td">70116</view>
        <view class="table-td">8.5%</view>
    </view>
</view>
```

acss：

```css
.table, .table div {
    margin: 0 auto;
}

.table {
    display: table;
    width: 100%;
    border-collapse: collapse; //合并边框
    box-sizing: border-box;
}

.table-tr {
    display: table-row; //此元素会作为一个表格行显示（类似 <tr>）
    height: 92rpx;
}

.table-th {
    display: table-cell; //此元素会作为一个表格单元格显示（类似 <td> 和 <th>）
    font-weight: bold;
    border: 1rpx solid gray;
    text-align: center;
    vertical-align: middle;
}

.table-td {
    display: table-cell;
    border: 1rpx solid gray;
    text-align: center;
    vertical-align: middle;
}
```

效果：

![](https://gitee.com/daluozha/luozha/raw/master/img/20200721004005.png)

