---
title: TypeScript 学习参考
date: 2021-06-15 09:34:18
tags:
---

### 为什么要使用 TypeScript
- 类型推演与类型匹配
- 开发编译时报错
- 极大程度的避免了低级错误
- 支持 JavaScript 最新特性(包含 ES 6/7/8)

### What's new ?
- 元组
- interface 接口
- 类型推论、联合类型、类型断言
- 枚举 Enum
- 范型 Generics
- 类型别名、字面量、交叉类型


### typescript 各大类型
|  类型   |      例子       |                             描述                             |
| :-----: | :-------------: | :----------------------------------------------------------: |
| number  |   1, -33, 2.5   |                           任意数字                           |
| string  |   'hi', "hi"    |                          任意字符串                          |
| boolean |   True, false   |                            布尔值                            |
| 字面量  |     其本身      |                 限制变量的值就是该字面量的值                 |
|   any   |        *        | 任意类型，对该变量关闭 ts 类型检测；any 类型可以赋值给任意变量；声明变量如果不指定类型，ts 解析器会自动判断变量的类型为 any |
| unknown |        *        | 类型安全的 any；unknown 类型不可以赋值给任意变量，除非使用**类型断言** as 或 <> |
|  void   | 空值(undefined) |           没有值(或 undefined)，主要用于函数返回值           |
|  never  |     没有值      | 不能是任何值；用于函数中表示永远不会返回结果，例如 throw new Error() |
| object  |       {}        |                        任意的 js 对象                        |
|  array  |       []        |       任意的 js 数组，类型声明：类型[] 或 Array<类型>        |
|  tuple  |     [4, 5]      |   元组，ts 新增类型，固定长度数组，语法：[类型 [,类型...]]   |
|  enum   |   enum{A, B}    |                      枚举， ts 新增类型                      |




```
// 直接使用字面量进行类型声明
let person : "male" | "female" // 联合类型
```

### 构造器的一个语法糖
```
class Person {
    constructor(public name: string, public age: number) {}
}

// 等价于
class Person {
    name: string
    age: number
    constructor(name: string, age: number) {
        this.name = name;
        this.age = age;
    }
}

```


### interface 和 type 区别

一句话总结：能用 interface 就用 interface，不行再用 type
详见 <https://juejin.cn/post/6844903749501059085 >


### 关于范型
在定义函数或是类时，如果遇到类型不明确的就可以使用范型。

- 在函数中的用法：
```
function fn<T>(a: T): T {
    return a;
}

// 不指定范型，类型自动推断为 number
fn(10) 

// 手动指定范型
fn<string>('hello') 
```

范型可以配合接口一起服用：
```
interface Inter {
    length: number
}

function fn2<T extends Inter>(a: T): number {
    return a.length
}

fn2('hello')
fn2({ length: 10 })
```

- 在类中的用法：
```
class Person<T>{
    name: T
    constructor(name: T) {
        this.name = name
    }
}

const person = new Person<string>('luozha')
```


### 相关问题
- 说说什么 Typescript 中的泛型？从你的理解来说，它的作用是什么？
泛型代表的是泛指某一类型，更像是一个类型变量。由尖括号包裹 <T>。
主要作用是创建逻辑可复用的组件。
泛型可以作用在函数、类、接口上。

