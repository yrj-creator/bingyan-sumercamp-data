# Git教程

## Git简介

Git是目前世界上最先进的分布式版本控制系统

Linus花了两周的时间用C语言编写，一个月之内，Linux系统的源码已经由Git管理

Github

集中式 vs 分布式

每个人的电脑里都有完整的版本库，不必联网

在实际使用时，通常也有一台充当中央服务器的电脑，但这个服务器的作用仅仅是用来方便交换大家的修改，没有它大家一样干活，只是交换修改不方便而已

## 安装Git

安装完成后，还需要最后一步设置，每个机器都必须自报家门，在命令行输入

```shell
$ git config --global user.name "Your Name"
$ git config --global user.name "email@example.com"
```

--global参数表示，这台机器上所有的Git仓库都会是用这个配置，当然也可以对某个仓库指定不同的用户名和Email地址

## 创建版本库

版本库又名仓库，repository

1、选择一个合适的地方，创建一个空目录

```shell
$ mkdir learngit
$ cd learngit
$ pwd
/Users/michael/learngit
```

2、通过 git init 这个命令把目录变成Git可以管理的仓库

```shell
$ git init
Initialized empty Git repository in /Users/michael/learngit/.git/
```

当前目录下会多一个.git的目录，这个目录是Git来跟踪管理版本库的，没事千万不要手动修改这个目录里面的文件，不然改乱了，就把Git仓库给破坏了

.git目录默认隐藏，用ls -ah命令就可以看见

所有的版本控制系统，其实只能跟踪文本文件的改动

Microsoft的Word格式是二进制格式的，因此，版本控制系统是无法跟踪Word文件的改动的。如果要真正使用版本控制系统，就要以纯文本方式编写文件

<img src="/Users/yurunjie/Library/Application Support/typora-user-images/截屏2020-07-19 上午11.55.38.png" alt="截屏2020-07-19 上午11.55.38" style="zoom:50%;" />

把一个文件放到Git仓库只需要两步

第一步，用命令 git add 告诉Git，把一个文件添加到仓库

```shell
$ git add readme.txt
```

第二步，用命令 git commit 告诉Git，把文件提交到仓库

```shell
$ git commit -m "wrote a readme file"
```

commit可以一次提交很多文件，所以你可以多次add不同的文件

## 时光机穿梭

## 远程仓库

实际情况往往是这样的，找一台电脑充当服务器的角色，每天24小时开机，其他每个人都从这个服务器仓库克隆一份到自己的电脑上，并且各自把各自的提交推送到服务器仓库里，也从服务器仓库中拉取别人的提交

只要注册一个GitHub账号，就可以免费获得Git远程仓库

由于本地Git仓库和GitHub仓库之间的传输是通过SSH加密的，所以，需要一点设置

1、创建SSH Key

```shel
$ ssh-keygen -t rsa -C "youremail@example.com"
```

可一路回车使用默认值，因为不是用于军事目的，所以也无需设置密码

如果一切顺利的话，可以在用户主目录里找到.ssh目录，里面有id_rsa和id_rsa.pub两个文件，这两个就是SSH Key的密钥对，id_rsa是私钥，不能泄漏出去，id_rsa.pub是公钥，可以放心地告诉任何人

2、登陆GitHub，打开Account settings，SSH Keys页面。新建Key，填上任意的Title，粘贴公钥中内容

<img src="/Users/yurunjie/Library/Application Support/typora-user-images/截屏2020-07-19 上午10.49.01.png" alt="截屏2020-07-19 上午10.49.01" style="zoom:50%;" />

SSH协议

SSH Key确认只有自己可以推送

当然，GitHub允许添加多个Key。假定有多台电脑，只要把每台电脑上的Key都添加到GitHub，就可以在每台电脑上往GitHub推送了

如果不想让别人看到Git库，一个是交点保护费，一个是搭建一个Git服务器，公司内部开发必备

### 添加远程库

现在的情景时，你已经在本地创建了一个Git仓库，又想在GitHub创建一个Git仓库，并且让这两个仓库进行远程同步，这样，GitHub上的仓库既可以作为备份，又可以让其他人通过该仓库来协作

1、Create a new repo，创建一个新的仓库

可以从这个仓库克隆出新的仓库，也可以把一个已有的本地仓库与之关联，然后，把本地仓库的内容推送到GitHub仓库

2、在本地的learngit仓库下运行命令

```shell
$ git remote add origin git@github.com:yrj-creator/learnGit.git
```

本地关联别人的远程库没有问题，但是推送是推不上去的，因为SSH Key公钥不在账户列表里

添加后，远程库的名字就是origin，这是Git默认的叫法，也可以改成别的，但是origin这个名字一看就知道是远程库

3、把本地的所有内容推送到远程库上

```shell
$ git push -u origin master
```

推送成功后，可以立刻在GitHub页面中看到远程库的内容已经和本地一摸一样了

从现在起，只要本地做了提交，就可以通过命令

```shell
$ git push origin master
```

把本地库的内容推送到远程，用git push命令，实际上是把当前分支master推送到远程

由于远程库是空的，我们第一次推送master分支时，加上-u参数，Git不但会把本地的master分支内容推送的远程新master分支，还会把本地的master分支和远程的master分支关联起来，在以后的推送或者拉取时就可以简化命令

把本地master分支的最新修改推送至GitHub，现在，你就拥有了真正的分布式版本库

<img src="/Users/yurunjie/Library/Application Support/typora-user-images/截屏2020-07-19 下午12.36.48.png" alt="截屏2020-07-19 下午12.36.48" style="zoom:50%;" />

### 从远程库克隆

之前，是现有本地库，后有远程库的时候，如何关联远程库

现在，我们假设从0⃣️开发，那么最好的方式是先创建远程库，然后，从远程库克隆

1、登陆GitHub，创建一个新的仓库，勾选Initialize this repository with a README

2、远程库已经准备好了，下一步是用命令 git clone 克隆一个本地库

```shell
$ git clone git@github.com:yrj-creator/gitSkills.git
```

GitHub给出的地址不止一个，还可以用https://github.com/michaelliao/gitskills.git这样的地址，实际上，Git支持多种协议，默认的git://使用ssh，但也可以使用https等多种协议。使用https除了速度慢以外，还有个最大的麻烦就是每次推送都必须输入口令，但是在某些只开放http端口的公司内部就无法使用ssh协议而只能使用https

## 分支管理

## 标签管理

## 使用GitHub

我们一直使用GitHub作为免费的远程仓库

在GitHub上，利用Git极其强大的克隆和分支功能，广大人民群众真正可以第一次自由参与各种开源项目

1、在GitHub上，可以任意Fork开源仓库

2、自己拥有Fork后的仓库的读写权限

```shell
git clone git@github.com:michaelliao/bootstrap.git
```

3、可以推送pull request给官方仓库来贡献代码

<img src="/Users/yurunjie/Library/Application Support/typora-user-images/截屏2020-07-19 上午9.58.31.png" alt="截屏2020-07-19 上午9.58.31" style="zoom:50%;" />

## 使用Gitee

## 自定义Git

## 使用SourceTree

