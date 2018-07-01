[TOC]



## 由来

大学的时候，自己有写日记，稍微记一下账单，但是苦于没有好工具可用。有找过类似日事清等一些软件，但这些软件

* 只能/擅长做某件事（日事清一般用来做行程安排），要几个软件都用才能满足自己各个方法的需求。
* 数据由他们保存，这是最重要的一点。
  * 一方面是保密问题，像日记这些东西虽然不是什么很机密的，还是存在自己本地的放心。
  * 另一方面导出不是很方便，有的软件提供导出，但可能只能导出成他们专用的格式，这样很不方便转移平台。

所以我基本上很少使用这些工具，总的来说原因就是这些工具并没有给我带来方便。



最开始的时候使用的txt文本来记录，这样的缺点也很明显：

* 数据需要手动对齐数据。
* 数据量不能太多不好管理，那个时候基本上一个月一个txt，就像 `2018-06-日记`，`2018-06-账单`  `2018-07-日记`  `2018-07-账单` 个样子，结果后面数量太多。
* 数据不好获取，其实整理这些日记是为了以后看，账单可能要做一下统计。整在txt中想要查看指定日记和统计不方便。

中间有段时间把日记，账单，行程安排等全部在同一个excel的不同sheet中做，在excel中做有很多好处，解决了txt的缺点：

* 单元格自带对齐功能。
* 就一个文件，备份也只需备份这个文件。不管全量还是增量都方便了很多。


* 使用excel的自带的统计功能也能做一些简单的统计。

但到后面也觉得不方便：

* 比如行程安排，我在excel中很难一眼看出哪些任务做了没做。如果用不同的背景色标注，一眼过去花花绿绿也难受，某天有什么任务没有完成，还要拉到对应的一天去看，比较麻烦。
* 后期加入其他一些东西，差不多6，7个sheet，管理起来也比较麻烦了。
* ......



所以大学期间就想做一个这样的系统，用来管理自己的一些东西。最近乘着有空，就根据自己的需求做了一个简单版本的。虽然这个项目并不是什么优秀的项目，但一方面是如果有人和我一样正在寻找一种解决方案，希望这个项目可以帮到你（虽然这个项目是按着我自己的需求做的，不过日记账单这些应该是通用的，同时如果需要你可以任意修改代码）。另一方面我是一个开源爱好者，在享受到其它开源项目的便利时，我也希望参与其中。



我自己也将持续使用这个项目作为个人管理，如果想到什么好主意也会持续添加到项目中。



## 介绍



该项目使用到了以下技术/工具

* ssm框架，spring + springmvc + mybatis
* maven构建
* mysql数据库
* layui界面



### 日记管理



日记列表：中规中矩的列表界面，可按日期范围进行搜索

注：该项目直接使用layui后台模板，不过做了一些修改：把顶端导航栏缩小，只留下左边和导航栏一样的宽度，给主面板留下足够的空间。

![日记列表](http://image.linxingyang.net/image/note/2018-06-30/01.png)



添加日记：根据我自己的需求，有日期，天气，写日记地点，心情，日记内容这五项需要输入。

![添加日记](http://image.linxingyang.net/image/note/2018-06-30/02.png)



### 账单管理

账单列表：提供根据账单的日期，账单的标签（每个账单只能有一个标签，标签在配置页面中增删改）进行查询日期。

![账单列表](http://image.linxingyang.net/image/note/2018-06-30/03.png)



添加账单：日期，金额，支付类型（现付/未现付  有些可能使用支付宝的花呗或者京东白条进行支付的），标签（一个账单只能选择一个标签）

![添加账单](http://image.linxingyang.net/image/note/2018-06-30/04.png)



### 任务模块

在构建任务模块的时候考虑的比较多。

然后根据我自己的需求，主要分为长期任务，周任务和天任务。



#### 长期任务

长期任务很简单，就任务内容，状态，开始时间和结束时间。主要写一些需要长时间完成的任务，或者留到日后再进行的任务。

![长期任务](http://image.linxingyang.net/image/note/2018-06-30/05.png)



#### 周任务



周任务大部分是参考长期任务的，该周完成正在进行中的长期任务的部分。

但是因为周任务可能不仅仅包括长期任务，可能还有其他一些本周需要做的但不处于长期任务之列，所以我这里没有将长期任务直接列入周任务，而需要手动添加周任务。

![周任务列表](http://image.linxingyang.net/image/note/2018-06-30/06.png)



添加周任务，此处是根据PDCA来的，虽然只是四个简单的文本域。

* plan:我是本周周日写下周的plan。PS：Plan中，不要泛泛而写，目标要很明确（以前我刚开始使用PDCA就犯过这个毛病，被老师批评过）。不写完成某功能，要写产出是什么。比如：不写“完成某项目的功能的划分”，要写“产出该项目的功能结构思维导图”（产出的是思维导图）。 “学习netty框架，到达入门会用”，到底什么程度才算是入门会用？或者写成“学习netty框架，完成一个使用netty提供文件下载小项目“，你会觉得更有成就感？类似的，很清楚最终你完成了该任务，会有什么成果出来即可。
* do:然后在下周的过程中如果完成了某个任务，就在do中写下完成的日期及完成任务的编号/名称。
* check:最后下周周日写check，看看自己本周任务完成的情况。分析未完成某项任务的原因，是自己没尽力？还是确实不可阻止的外力导致无法完成？还是自己对任务用时估计错误？进行反思总结，这样可以培养自己对任务进度的估算能力，也有助于认清自己的能力，渐渐的以后安排任务会得心应手。
* action: 安排下周的action，本周未完成的可以顺延下周，以及安排下周的新任务。



![添加周任务](http://image.linxingyang.net/image/note/2018-06-30/07.png)



#### 天任务



在介绍天任务之前需要看一下任务管理和任务安排两个模块。



##### 任务管理



任务管理列表页面，根据任务优先级倒序排列。我根据自己的需求，创建任务时按照如下优先级创建任务

* 紧急任务，优先级10
* 天任务，优先级为9
* 周任务，优先级8
* 月任务，优先级7
* 年任务，优先级6
* 临时任务，优先级1

![任务管理](http://image.linxingyang.net/image/note/2018-06-30/08.png)



##### 任务安排



任务安排，在任务管理的添加的任务，都能够在这里进行安排。安排某任务可以选择一个日期范围。

通常，我会在

* 今年年末安排下一年的年任务。


* 本月月末安排下一月的月任务。
* 本周末安排下周的周任务和天任务。



![任务安排](http://image.linxingyang.net/image/note/2018-06-30/09.png)



##### 天任务

在天任务列表，使用右侧日期选择器查看某一天的任务。任务有是否完成按钮（完成后勾选）和状态按钮（放弃/未能完成该任务后时去掉勾选）。



所以整个任务模块的思路：长期任务（进行中的长期任务）-->周任务（进行中的长期任务的部分+本周需要完成的其他任务）-->天任务（周任务+固定的周任务+固定的天任务）

这样，只需要每周末安排，然后接下来的一周每天看当天任务即可。

![天任务](http://image.linxingyang.net/image/note/2018-06-30/10.png)





下面这些模块是为了个人定制的，所以可能不太适合。

### 图书模块

看书难免有一些读后感，比如读胡适文集，就特别有一些感想吧。之前有在excel中记录读了哪些书以及一些读后感。所以这次也在这个系统中加了一个图书管理模块。



添加图书界面，书名，作者，标签（和账单标签一样在配置页面中增删改），读后感。

![添加图书](http://image.linxingyang.net/image/note/2018-06-30/12.png)

图书列表

![图书列表](http://image.linxingyang.net/image/note/2018-06-30/11.png)





### 大事件管理



添加大事件：日期，类型（固定了三个类型：关于我，认识的人，社会上），事件，感想

![添加事件](http://image.linxingyang.net/image/note/2018-06-30/13.png)

大事件列表：这个是为了记录一些特别的时间点，也有部分原因是由于发现layui有timeline的功能，所以才打算加入这个模块。

![大事件列表](http://image.linxingyang.net/image/note/2018-06-30/14.png)



### 未来的信



0.0 每个时期的心理都不同，写一写，未来看一看，回味一下。

![未来的信列表](http://image.linxingyang.net/image/note/2018-06-30/15.png)



### 认识的人管理



其实这几个模块都是根据我自己的excel中的记录变化而来。因为脑子是不可靠的，没办法记住每个人的一些细节，所以我会在这里进行一些记录。

* 关于人物小传，我常常问长辈一些过去的事，比如我爸妈是怎么认识的，我小时候做过一些什么傻事之类的。所以我会给某些人添加他的小传，记录一些我经历的，听到的事情吧。这些事情不适合写在日记中，所以才有了这个人物小传吧。
* 关于密语，有的时候会突然想起某个人，同学啊，某个人认识的，我就会到这里写上一些话。

![认识的人列表](http://image.linxingyang.net/image/note/2018-06-30/16.png)



### 喜欢的话



总有一些喜欢的话，所以特地弄了一个页面来记录。

![喜欢的话列表](http://image.linxingyang.net/image/note/2018-06-30/17.png)



### 配置



下图中，

* 类型表示该记录属于哪一个类型，当前类型就是一下四种
  * url，每个页面中使用到的url，基本上无需变动。
  * menu，菜单管理，根据需要可以变动
  * bookTag，图书标签
  * billTag，账单标签
* 分组ID：分组所在ID
* 属性ID：属性对应id
* 属性值：属性对应值



![配置列表](http://image.linxingyang.net/image/note/2018-06-30/18.png)



#### url

这个一般不需要变动，除非你自己添加了功能，则需要在其中进行配置。

分组ID用于指示该url属于哪个分组

* 分组ID=bigThing就是大事件，这个名字当然是自己取得，不过页面中获得大事件相关URL是通过 `type=url&groupId=bigThing`这两个条件来获取的

属性ID用于指示url的用途，比如

* 属性ID=goAdd就是前往添加页面
* 属性ID=add就是添加对应记录

这个我都有统一命名。

![配置列表](http://image.linxingyang.net/image/note/2018-06-30/18.png)



#### menu

* 菜单的type为menu。


* 分组ID：相同分组ID将会出现在同一个菜单栏下。根据分组ID正序排列。
* 分组名称：会成为父菜单栏的名称，比如当前左侧的导航栏的父菜单栏根据配置有：日常，个人，配置三项
* 属性ID：根据属性ID正序排列。
* 属性名称：当前的属性名会变成对应子菜单的名称，比如当前左侧导航栏中日常菜单项下有：日记管理，账单管理等。
* 属性值：对应页面的url



![配置列表](http://image.linxingyang.net/image/note/2018-06-30/19.png)



![配置列表](http://image.linxingyang.net/image/note/2018-06-30/20.png)



#### bookTag图书标签

图书标签根据自己的需要进行新建，注意类型一定要为bookTag即可。



![配置列表](http://image.linxingyang.net/image/note/2018-06-30/21.png)



分组ID相同的会被视为同一组，在图书列表界面同一组的会排在一起，如下图

![图书列表](http://image.linxingyang.net/image/note/2018-06-30/11.png)





#### billTag账单标签

也和bookTag差不多

![配置列表](http://image.linxingyang.net/image/note/2018-06-30/22.png)



### 另外注意的

只有日记和人物小传的字段使用了text，可以输入较多文字。

其他一些文本字段使用的是varchar，文字数量是有限制的。

如果觉得哪个字段长度不够用，可以进行相应的扩大。（注意要事先备份好数据）



## 安装



目录结构：

* mysql_script : mysql脚本
* source ：源码
* war ： war包



有两种方式，一种是部署源码，一种是直接使用war包。

### 部署源码

环境要求

- JDK1.6及以上
- tomcat6及以上
- eclipse/myeclipse
- mysql数据库
- maven



步骤：

* 在Mysql中运行`mysql_script/selfmanager.sql`脚本，其中有建库命令，建表命令，以及配置表的初始化数据。


* 解压`source`文件夹中的`selfmananger.rar`文件。
* 将解压后的项目导入加入到你的IDE中，比如eclipse/myeclipse
* 修改`src/main/resources/config/database/mysql.properties`中的下面几项为你自己的配置。
  * JDBC.URL
  * JDBC.User
  * JDBC.Password
* 启动tomcat服务器访问 http://localhost:8080/selfmanager 即可



### 部署war包

* 在Mysql中运行`mysql_script/selfmanager.sql`脚本，其中有建库命令，建表命令，以及配置表的初始化数据。


* 复制`war/selfmanager.war`到`你的tomcat目录/webapps/`目录下
* 进入selfmanager.war中，修改`src/main/resources/config/database/mysql.properties`中的下面几项为你自己的配置。
  - JDBC.URL
  - JDBC.User
  - JDBC.Password
* 启动tomcat服务器访问 http://localhost:8080/selfmanager 即可





## 关于备份建议

备份很重要，备份太勤快又累，懒于备份又要时时刻刻当心数据的丢失。



现在我是一周一备份，丢失一周的数据对我来说是可承受的。之前也次误操作删除了一月的数据，那心情简直沮丧到极点，尤其是日记数据的丢失。





## 后期可能考虑加入

- 图表展示：账单，任务完成情况等后期可能加入图表展示。


- 报表数据导出/导入。
- 移动版：借用Bootstrap的移动优先概念，大部分人可能会比较习惯使用手机而不是电脑吧。



## 致谢



感谢 [layui](http://www.layui.com/) ，使用既有的前端框架使得开发速度变快了很多。

感谢404页面的[提供者](http://w3layouts.com) 。

当然像maven，spring这些工具/框架就更不用说了。



## 联系我



如果发现bug或者有什么好的建议或意见（比如添加什么模块之类的），可以给我发邮件。

我的邮箱：linxingy@foxmail.com 



## License

MIT