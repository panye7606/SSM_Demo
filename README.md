## 学生.班级 SSM_Demo 

### 有些话想在最开始说

**出发点**：近期给自己冲了下电，想结合之前学习的零碎知识，做一个整合，故而产生了下面的这个小项目。此本项目较为精简，针对最简单的 学生 - 班级 关系模型，实现CURD等基础操作，并做了较为规范和详细的注释说明。


**整合的相关技术**：
- BootStrap 快速搭建页面  
  Bootstrap 是一套用于 HTML、CSS 和 JS 开发的开源工具集。利用其提供的 Sass 变量和大量 mixin、响应式栅格系统、可扩展的预制组件、基于 jQuery 的强大的插件系统，能够快速为你的想法开发出原型或者构建整个 app 。

- Maven 进行项目构建和依赖管理  
  Maven项目对象模型(POM)，可以通过一小段描述信息来管理项目的构建，报告和文档的项目管理工具软件。
  Maven 除了以程序构建能力为特色之外，还提供高级项目管理工具。由于 Maven 的缺省构建规则有较高的可重用性，所以常常用两三行 Maven 构建脚本就可以构建简单的项目。

- Spring  SpringMVC  Mybatis（SSM） 整合与配置及使用  
  SSM（Spring+SpringMVC+MyBatis）框架集由Spring、MyBatis两个开源框架整合而成（SpringMVC是Spring中的部分内容）。其中，Spring是一个轻量级的控制反转（IoC）和面向切面（AOP）的容器框架。SpringMVC分离了控制器、模型对象、分派器以及处理程序对象的角色，这种分离让它们更容易进行定制。MyBatis是一个支持普通SQL查询，存储过程和高级映射的优秀持久层框架。
  页面发送请求给控制器，控制器调用业务层处理逻辑，逻辑层向持久层发送请求，持久层与数据库交互，后将结果返回给业务层，业务层将处理逻辑发送给控制器，控制器再调用视图展现数据。

- Generator  进行逆向工程  
  可以逆向工程，快速搭建，具有良好的开发效果。

- PageHelper 分页管理  
  如果你也在用 MyBatis，建议尝试该分页插件，这一定是最方便使用的分页插件。分页插件支持任何复杂的单表、多表分页。

*tip*：欢迎大家针对上述技术，进行交流与共同学习~   本人QQ：854828392
---

### 项目简图

- 首页  
![预览图](https://github.com/Zhangxuan-Xing/SSM_Demo/blob/master/Picture/FirstPage.png)

- 添加  
![预览图](https://github.com/Zhangxuan-Xing/SSM_Demo/blob/master/Picture/Creat.png)

- 校验  
![预览图](https://github.com/Zhangxuan-Xing/SSM_Demo/blob/master/Picture/Validate.png)

- 删除  
![预览图](https://github.com/Zhangxuan-Xing/SSM_Demo/blob/master/Picture/Delete.png)

- 修改  
![预览图](https://github.com/Zhangxuan-Xing/SSM_Demo/blob/master/Picture/Update.png)
