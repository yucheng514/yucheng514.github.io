---
title: Vue3 One Piece 初探
date: 2022-03-19 21:55:10
tags:
---
<center>
    <img style="border-radius: 0.3125em;box-shadow: 0 2px 4px 0 rgba(34,36,38,.12),0 2px 10px 0 rgba(34,36,38,.08);transform:scale(0.5);" src="https://static.vue-js.com/6280b990-ff19-11ea-85f6-6fac77c0c9b3.png">
</center>


### Vue2 与 Vue3 响应式原理的区别
```
// Vue2
Object.defineProperty(data, 'count', {
    get() {},
    set() {},
})

// Vue3
new Proxy(data, {
    get(key) {},
    set(key, value) {},
})
```





### sth else
- setup scripts : <https://fe-blog.workplus.io/vue3-script-setup >
- 选项式 vs 组合式: <https://vuejs.org/guide/introduction.html#api-styles >