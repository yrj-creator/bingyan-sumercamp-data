# 第七章 网络安全

计算机网络安全是另一门专业学科

## 网络安全问题概述

### 计算机网络面临的安全性威胁

计算机网络的通信面临两大类威胁，即被动攻击和主动攻击

<img src="/Users/yurunjie/Library/Application Support/typora-user-images/截屏2020-07-23 上午10.15.41.png" alt="截屏2020-07-23 上午10.15.41" style="zoom:50%;" />

被动攻击是指攻击者从网络上窃听他人的通信内容。通常把这类攻击称为截获。在被动攻击中，攻击者只是观察和分析某一个协议数据单元PDU而不干扰信息流。即使这些数据对攻击者来说是不易理解的，它也可以通过观察PDU的协议控制信息部分，了解正在通信的协议实体的地址和身份，研究PDU的长度和传输的频度，从而了解所交换的数据的某种性质。这种被动攻击又称为流量分析

主动攻击有如下几种最常见的方式

（1）篡改

攻击者故意篡改网络上传送的报文，这里也包括彻底中断传输的报文，甚至是把完全伪造的报文传送给接收方。这种攻击方式有时也称为更改报文流

（2）恶意程序

* 计算机病毒，一种会传染其他程序的程序，传染是通过修改其他程序来把自身或自己的变种复制进去而完成的
* 计算机蠕虫病毒，一种通过网络的通信功能将自身从一个结点发送到另一个结点并自动启动运行的程序
* 特洛伊木马，一种程序，他执行的功能并非所声称的功能而是某种恶意功能。计算机病毒有时也已特洛伊木马的形式出现
* 逻辑炸弹，一种当运行环境满足某种特定条件时执行其他特殊功能的程序
* 后门入侵，是指利用系统实现中的漏洞通过网络入侵系统
* 流氓软件，一种未经用户允许就在用户计算机上安装运行并损害用户利益的软件。现在流氓软件的泛滥程度已超过了各种计算机病毒，成为互联网上最大的公害

上面所说的计算机病毒是狭义的，也有人把所有的恶意程序泛指为计算机病毒

（3）拒绝服务DoS

指攻击者向互联网上的某个服务器不停的发送大量分组，使该服务器无法提供正常服务，甚至完全瘫痪

若从互联网上的成百上千个网站集中攻击一个网站，则称为分布式拒绝服务DDoS。有时也把这种攻击称为网络带宽攻击或连通性攻击

还有其他类似的网络问题。例如，在使用以太网交换机的网络中，攻击者向某个以太网交换机发送大量的伪造源MAC地址的帧。以太网交换机收到这样的帧，就把这个假的源MAC地址写入交换表中（因为表中没有这个地址）。由于伪造的数量太大，因此很快就会把交换表填满了，导致以太网交换机无法正常工作（称为交换机中毒）

对于主动攻击，可以采取适当措施加以检测。但对被动攻击，通常却是检测不出来的

根据这些特点，可得出计算机网络通信安全的目标如下：

（1）防止析出报文内容和流量分析

（2）防止恶意程序

（3）检测更改报文流和拒绝服务

对付被动攻击可采用各种数据加密技术，而对付主动攻击，则需要将加密技术与适当的鉴别技术相结合

### 安全的计算机网络

形式化方法证明 经验分析安全性

1、保密性

2、端点鉴别

3、信息的完整性

在谈到鉴别时，有时是同时包含了端点鉴别和报文的完整性。也就是说，既要鉴别发送方的身份，又鉴别报文的完整性

4、运行的安全性

访问控制

### 数据加密模型

<img src="/Users/yurunjie/Library/Application Support/typora-user-images/截屏2020-07-23 上午11.46.41.png" alt="截屏2020-07-23 上午11.46.41" style="zoom:50%;" />

这里我们假定加密密钥和解密密钥都是一样的。但实际上他们可以是不一样的（即使不一样，这两个密钥也必然有某种相关性）。密钥通常由密钥中心提供。当密钥需要向原地传送时，一定要通过另一个安全信道

密码编码学是密码体制的设计学，而密码分析学则是在未知密钥的情况下从密文推演出明文或密钥的技术。密码编码学与密码分析学合起来即为密码学cryptology

如果不论截取者获得了多少密文，但在密文中都没有足够的信息来唯一地确定出对应的明文，则这一密码体制称为无条件安全的，或称为理论上是不可破的。在无任何限制的条件下，目前几乎所有实用的密码体制均是可破的。因此，人们关心的是要研制出在计算上是不可破的密码体制

## 两类密码体制

### 对称密钥密码体制

所谓对称密钥加密体制，即加密密钥与解密密钥是使用相同的密码体制

数据加密标准DES属于对称密钥加密体制

DES是一种分组密码。在加密前，先对整个的明文进行分组。每一个组为64位长的二进制数据。然后对每一个64位二进制数据进行加密处理，产生一组64位密文数据，最后将各组密文串接起来，即得出整个的密文。使用的密钥占有64位（实际密钥长度为56位，外加8位用于奇偶验证）

DES的保密性仅取决于对密钥的保密，而算法是公开的。DES的问题是他的密钥长度。56位DES已不再被认为是安全的

三重DES。把一个64位明文用一个密钥加密，在用另一个密钥解密，然后再使用第一个密钥加密

三重DES广泛应用于网络、金融、信用卡等系统

高级加密标准AES

### 公钥密码体制

公钥密码体制的产生主要由两个方面的原因，一是由于对称密钥体制的密钥分配问题，二是由于对数字签名的需求

在对称密钥密码体制中，加解密的双方使用的是相同的密钥。如果事先约定密钥，就会给密钥的管理和更换带来极大的不便。若使用高度安全的密钥分配中心KDC，也会使得网络成本增加

对数字签名的强烈需求也是产生公钥密码体制的一个原因。在许多应用中，人们需要对纯数字的电子信息进行签名，表明该信息确实是某个特定的人产生的

RSA体制，它是基于数论中的大数分解问题的体制

（1）密钥对产生器产生出接收者B的一对密钥：加密密钥PKB和解密密钥SKB。发送者A所用的加密密钥PKB就是接受者B的公钥，他向公众公开。而B所用的解密密钥SKB就是接受者B的私钥，对其他人都保密

（2）发送者A用B的公钥PKB通过E运算对明文X加密，得出密文Y，发送给B。B用自己的私钥SKB通过D运算进行解密，恢复出明文

（3）虽然在计算机上可以容易的产生成对的PKB和SKB，但从已知的PKB实际上不可能推导出SKB，即从PKB到SKB是计算上不可能的

（4）虽然公钥可用来加密，但却不能用来解密

（5）先后对X进行D运算和E运算或进行E运算和D运算，结果都是一样的

使用对称密钥时，一对一的双向保密通信

在使用公开密钥时，多对一的单向保密通信，反方向的保密通信则是不行的

任何加密方法的安全性取决于密钥的长度，以及攻破密文所需的计算量，而不是简单的取决于加密的体制（公钥密码体制或传统加密体制）。我们还要指出，公钥密码并没有使传统密码体制被弃用，因为目前公钥加密算法的开销较大，在可见的将来还不会放弃传统加密方法

## 数字签名

（1）接收者能够核实发送这对报文的签名。也就是说，接收者能够确信该报文的确是发送者发送的。报文鉴别

（2）接收者确信收到的数据和发送者发送的完全一样而没有被篡改过。报文的完整性

（3）发送者事后不能抵赖对报文的签名。不可否认🙅‍♂️

采用公钥算法要比采用对称密钥算法更容易实现

<img src="/Users/yurunjie/Library/Application Support/typora-user-images/截屏2020-07-23 下午12.50.47.png" alt="截屏2020-07-23 下午12.50.47" style="zoom:50%;" />

上述过程只是对报文进行了签名，对报文X本身却未保密

<img src="/Users/yurunjie/Library/Application Support/typora-user-images/截屏2020-07-23 下午12.51.35.png" alt="截屏2020-07-23 下午12.51.35" style="zoom:50%;" />

## 鉴别

鉴别和加密的概念不同，鉴别是要验证通信的对方的确是自己所要通信的对象，而不是其他的冒充者，并且所传送的报文是完整的，没有被他人篡改过

鉴别和授权是不同的概念。授权涉及的问题是：所进行的过程是否被允许（如是否可以对某文件进行读或写）

有时可再把鉴别细分为两种。一种是报文鉴别，即鉴别所受到的报文的确是报文的发送者发送的，而不是其他人伪造的或篡改的。这就包含了端点鉴别和报文完整性的鉴别。另一种则是实体鉴别，即仅仅鉴别发送报文的实体。实体可以是一个人，也可以是一个进程（客户或服务器）。这就是端点鉴别

### 报文鉴别

1、密码散列函数

数字签名能够实现对报文的鉴别。然而这种方式有一个很大的缺点，就是对较长的报文（这是很常见的）进行数字签名会使计算机增加非常大的负担，因为这需要进行较多的时间来进行运算。因此，我们需要找出一种相对简单的方法对报文进行鉴别，这种方式就是使用密码散列函数

检验和就是散列函数的一种应用，用于发现数据在传输过程中的比特差错

散列函数的特点

（1）散列函数的输入长度可以很长，但其输出长度则是固定的，并且较短。散列函数的输出叫做散列值，或更简单些，称为散列

（2）不同的散列值肯定对应于不同的输入，但不同的输入却可能得出相同的散列值。散列函数的输入和输出多对一

密码散列函数，要找到两个不同的报文，他们具有同样的密码散列函数输出，在计算上是不可行的。也就是说，密码散列函数实际上是一种单向函数

<img src="/Users/yurunjie/Library/Application Support/typora-user-images/截屏2020-07-23 下午1.16.51.png" alt="截屏2020-07-23 下午1.16.51" style="zoom:50%;" />

2、实用的密码散列函数MD5和SHA-1

MD就是Message Digest的缩写，意思是报文摘要

SHA Secure Hash Algorithm

MD5的逆向变换是不可能的这一传统观念以受到了颠覆性的动摇，可以通过系统的方法在较短的时间内找出一对报文具有相同的MD5报文摘要，有许多学者开发了对MD5实际的攻击

MD5最终被另一种叫做安全散列算法SHA的标准所取代

MD5算法的大致过程如下：

（1）先把任意长的报文按模2^64计算其余数（64位），追加到报文的后面

（2）在报文和余数之间填充1~512位，使得填充后的总长度是512的整数倍。填充的首部是1，后面都是0

（3）把追加和填充后的报文分割成一个个512位的数据块，每个512位的报文数据再分成4个128位的数据块依次送到不同的散列函数进行四轮计算。每一轮又都按32位的小数据块进行复杂的运算。一直到最后计算出MD5报文摘要代码（128位）

这样得出的MD5报文摘要代码中的每一位都与原来报文中的每一位有关。由此可见，像MD5这样的密码散列函数实际上已是个相当复杂的算法，而不是简单的函数了

SHA比MD5更安全，但计算起来却比MD5要慢些。后来SHA-1也被证明其实际安全性并未达到设计要求。虽然现在SHA-1也在使用，但很快就会被另外的两个版本SHA-2和SHA-3所替代

3、报文鉴别码

<img src="/Users/yurunjie/Library/Application Support/typora-user-images/截屏2020-07-23 下午1.38.12.png" alt="截屏2020-07-23 下午1.38.12" style="zoom:50%;" />

像上面列举的做法，实际上是不可行的。解决的办法并不复杂，就是对散列进行一次加密

<img src="/Users/yurunjie/Library/Application Support/typora-user-images/截屏2020-07-23 下午1.39.18.png" alt="截屏2020-07-23 下午1.39.18" style="zoom:50%;" />

报文鉴别码MAC（Message Authentication Code）

局域网中使用的媒体接入控制MAC也是使用这三个字母

现在整个报文是不需要加密的。虽然从散列H导出报文鉴别码MAC需要加密算法，但由于散列H的长度通常都远远小于报文X的长度，因此这种加密不会消耗很多的计算资源。这样，使用鉴别码MAC就能够很方便的保护报文的完整性

现在已经有了好几个不同的MAC标准，而使用最广泛的就是HMAC，他可以和MD5或SHA-1一起使用

采用什么方法可以安全有效的分发通信双方共享的密钥？一种可行的方法是采用公钥系统，用户A用其私钥对散列H进行运算，采用这种方式得到的扩展报文，不仅是不可伪造的，也是不可否认的

### 实体鉴别

实体鉴别和报文鉴别不同。报文鉴别是对每一个收到的报文都要鉴别报文的发送者，而实体鉴别实在系统接入的全部持续时间内对和自己通信的对方实体只需验证一次

<img src="/Users/yurunjie/Library/Application Support/typora-user-images/截屏2020-07-23 下午1.49.22.png" alt="截屏2020-07-23 下午1.49.22" style="zoom:50%;" />

为了对付重放攻击，可以使用不重数nonce。不重数就是一个不重复使用的大随机数，即一次一数。在鉴别过程中不重数可以使B能够把重复的鉴别请求和新的鉴别请求区分开来

<img src="/Users/yurunjie/Library/Application Support/typora-user-images/截屏2020-07-23 下午1.50.52.png" alt="截屏2020-07-23 下午1.50.52" style="zoom:50%;" />

在使用公钥密码体制时，可以对不重数进行签名认证

公钥密码体制虽然不必在互相通信的用户之间秘密地分配共享密钥，但仍有受到攻击的可能

中间人攻击

由此可见，公钥的分配和认证公钥的真实性也是一个非常重要的问题

## 密钥分配

密钥管理包括：密钥的产生、分配、注入、验证和使用

密钥分配（或密钥分发）是密钥管理中最大的问题。密钥必须通过最安全的通路进行分配

网外分配方式	网内分配方式，即对密钥自动分配

### 对称密钥的分配

目前常用的密钥分配方式是设立密钥分配中心KDC。KDC是大家都信任的机构，其任务就是给需要进行秘密通信的用户临时分配一个会话密钥（仅使用一次）

假定用户A和B都是KDC的登记用户。A和B在KDC登记时就已经在KDC的服务器上安装了各自和KDC进行通信的主密钥KA和KB

1、用户A向KDC发送时用明文，说明想和用户B通信。在明文中给出A和B在KDC登记的身份

2、KDC用随机数产生一次一密的会话密钥KAB供A和B的这次会话使用，然后向A发送回答报文。这个回答报文用A的密钥KA加密。这个报文中包含这次会话使用的密钥KAB和请A转给B的一个票据，该票据包括A和B在KDC登记的身份，以及这次会话将要使用的密钥KAB。票据用B的密钥KAB加密，A无法知道此票据的内容，因为A没有B的密钥KB，当然A也不需要知道此票据的内容

3、当B收到A转来的票据并使用自己的密钥KB解密后，就知道A要和他通信，同时也知道KDC为这次和A通信所分配的会话密钥KAB了

在网络上传送密钥时，都是经过加密的。解密用的密钥都不在网上传送

KDC还可在报文中加入时间戳，以防止报文的截取者利用已记录下的报文进行重放攻击。会话密钥时一次性的，因此保密性较高，而KDC分配给用户的密钥KA和KB，都应定期更换，以减少攻击者破译密钥的机会

目前最出名的密钥分配协议时Kerberos V5，使用AES进行加密

Kerberos使用两个服务器：鉴别服务器AS、票据授予服务器TGS。Kerberos只用于客户与服务器之间的鉴别，而不用于人对人的鉴别。

P338

### 公钥的分配

在公钥密码体制中，如果每个用户都具有其他用户的公钥，就可实现安全通信

需要一个值得信赖的机构来将公钥与其对应的实体进行绑定。这样的机构就叫做认证中心CA，他一般由政府出资建立。每个实体都有CA发来的证书，里面有公钥极其拥有着的标识信息（人名或IP地址）。此证书被CA进行了数字签名。任何用户都可从可信的地方获得认证中心CA的公钥，此公钥来验证某个公钥是否为某个实体所拥有（通过向CA查询）。有的大公司也提供认证中心服务

## 互联网使用的安全协议

### 网络层安全协议

1、IPsec协议族概述

虚拟专用网VPN中传送的信息都是经过加密的。提供这种加密服务的就是IPsec

IPsec并不是一个单一协议，而是能够在IP层提供互联网通信安全的协议族。IPsec并没有限定用户必须使用何种特定的加密和鉴别算法。实际上，IPsec是个框架，它允许通信双方选择合适的参数和算法（例如，密钥长度）。为保证互操作性，IPsec还包含了一套加密算法，所有IPsec的实现都必须使用

IPsec就是IP安全（security）的缩写

IPsec协议族中的协议可划分为以下三个部分：

（1）IP安全数据报格式的两个协议：鉴别首部AH（Authentication Header）协议和封装安全有效载荷ESP（Encapsulation Payload）协议

（2）有关加密算法的三个协议

（3）互联网密钥交换IKE（Internet Key Exchange）协议

后面我们要重点介绍IP安全数据报的格式，以便了解IPsec怎样提供网络层的安全通信。AH协议提供源点鉴别和数据完整性，但不能保密。而ESP协议比AH协议复杂的多，它提供源点鉴别、数据完整性和保密。IPsec支持IPv4和IPv6。在IPv6中，AH和ESP都是扩展首部的一部分。AH协议的功能都已包含在ESP协议中，因此使用ESP协议就可以不使用AH协议。下面我们将不再讨论都已包含在ESP协议中，因此使用ESP协议就可以不使用AH协议。下面我们将不再讨论AH协议，而只介绍ESP协议的要点

使用ESP或AH协议的IP数据报称为IP安全数据报（IPsec数据报），它可以在两台主机之间、两个路由器之间或一台主机和一个路由器之间发送

IP安全数据报有以下两种不同的工作方式

第一种工作方式是运输方式。运输方式是在整个运输层报文段的前后分别添加若干控制信息，再加上IP首部，构成IP安全数据报

第二种工作方式是隧道方式。隧道方式是在原始的IP数据报的前后分别添加若干控制信息，再加上新的IP首部，构成一个IP安全数据报

无论使用哪种方式，最后得出的IP数据报的IP首部都是不加密的。只有使用不加密的IP首部，互联网上的各个路由器才能识别IP首部中的有关信息，把IP安全数据报在不安全的互联网中进行转发，从源点安全地转发到终点。所谓安全数据报是指数据报的数据部分是经过加密的，并能够被鉴别的。通常把数据报的数据部分称为数据报的有效载荷

由于目前使用最多的就是隧道方式，因此下面的讨论只限于隧道方式

2、安全关联

在发送IP安全数据报之前，在源实体和目的实体之间必须创建一条网络层的逻辑连接，即安全关联SA（Security Association）。这样，传统的互联网中无连接的网络层就变为了具有逻辑连接的一个层。安全关联是从源点到终点的单向连接，它能够提供安全服务。如要进行双向安全通信，则两个方向都需要建立安全关联

在这些安全关联SA上传送的就是IP安全数据报

<img src="/Users/yurunjie/Library/Application Support/typora-user-images/截屏2020-07-23 下午3.21.11.png" alt="截屏2020-07-23 下午3.21.11" style="zoom:50%;" />

原始的IP数据报隐藏在IP安全数据报中了

<img src="/Users/yurunjie/Library/Application Support/typora-user-images/截屏2020-07-23 下午3.22.21.png" alt="截屏2020-07-23 下午3.22.21" style="zoom:50%;" />

建立安全关联SA的路由器或主机，必须维护这条SA的状态信息

（1）一个32位的连接标识符，称为安全参数索引SPI

（2）安全关联SA的源点和终点的IP地址

（3）所使用的加密类型

（4）加密的密钥

（5）完整性检查的类型

（6）鉴别使用的密钥

当路由器R1要通过SA发送IP安全数据报时，就必须读取SA的这些状态信息，以便知道如何把IP数据报进行加密和鉴别

3、IP安全数据报的格式

以隧道方式为例

<img src="/Users/yurunjie/Library/Application Support/typora-user-images/截屏2020-07-23 下午3.27.01.png" alt="截屏2020-07-23 下午3.27.01" style="zoom:50%;" />

P343

4、IPsec的其他构件

发送IP安全数据报的实体可能要用到很多条安全关联SA

安全关联数据库SAD Security Association Database

当主机要发送IP安全数据报时，就在SAD中查找相应的SA，以便获得必要的信息，来对该IP安全数据报实施必要保护。同样，当主机要接受IP安全数据报时，也要在SAD中查找相应的SA，以便获得信息来检查该分组的安全性

安全策略数据库SPD Security Policy Database

SPD指明什么样的数据报需要进行IPsec处理，这取决于源地址、源端口、目的地址、目的端口、以及协议的类型等

当一个IP数据报到达时，SPD指出应当做什么（使用IP数据报还是不使用），而SAD则指明了应当使用哪一个SA

互联网密钥交换IKE协议——为IP安全数据报创建安全关联SA

IKEv2以另外三个协议为基础：

（1）Oakley——密钥生成协议

（2）安全密钥交换机制——用于密钥交换协议。他利用公钥加密来实现密钥交换协议中的实体鉴别

（3）互联网安全关联和密钥管理协议——用于实现IKE中定义的密钥交换，使IKE的交换能够以标准化、格式化的报文创建安全关联SA

### 运输层安全协议

* 安全套接字层SSL（Secure Socket Layer）
* 运输层安全TLS（Transport Layer Security）

SSL作用在端系统应用层的HTTP和运输层之间，在TCP之上建立一个安全通道，为通过TCP传输的应用层数据提供安全保障

IETF在SSL 3.0的基础上设计了TLS协议，为所有基于TCP的网络应用提供安全数据传输服务

运输层原来还有一个安全电子交易SET协议，是专门用于在互联网上进行安全信用卡交易的协议，但后来在市场竞争中失败了

很多浏览器都已使用了SSL和TLS

<img src="/Users/yurunjie/Library/Application Support/typora-user-images/截屏2020-07-23 下午4.20.52.png" alt="截屏2020-07-23 下午4.20.52" style="zoom:50%;" />

使用SSL后的情况有些特殊，因为SSL增强了TCP的服务（更加安全了），因此，SSL应该是运输层协议。然而实际上，使用安全运输的应用程序（如HTTP）却把SSL驻留在应用层

应用层使用SSL最多的就是HTTP，但SSL并非仅用于HTTP，而是可用于任何应用层的协议。例如，SSL也可用于IMAP邮件的鉴别和数据加密。当使用普通不加密的浏览器查看网页时，HTTP就直接使用TCP连接，这时SSL不起作用。但使用信用卡进行网上支付，就需要使用安全的浏览器，这时，应用程序HTTP就调用SSL对整个网页进行加密。网页上会提示用户，同时网址栏原来显示http的地方，现在变成了https。TCP的HTTPS端口号是443，而不是平时使用的端口号80

SSL提供的安全服务可归纳为以下三种：

（1）SSL服务器鉴别，允许用户证实服务器的身份。支持SSL的客户端通过验证来自服务器的证书，来鉴别服务器的真实身份并获得服务器的公钥

（2）SSL客户鉴别，SSL的可选服务，允许服务器证实客户的身份

（3）加密的SSL会话，对客户和服务器间发送的所有报文进行加密，并检测报文是否被篡改

当顾客点击该网站的链接建立TCP连接后，先进行浏览器和服务器之间的握手协议，完成加密算法的协商和会话密钥的传递，然后进行安全数据传输

（1）协商加密算法

（2）服务器鉴别

（3）会话密钥计算。由浏览器A随机产生一个秘密数。用服务器B的RSA公钥进行加密后发送给B。双方根据协商的算法产生共享的对称会话密钥

（4）安全数据传输

上述的SSL安全会话建立过程

<img src="/Users/yurunjie/Library/Application Support/typora-user-images/截屏2020-07-23 下午4.28.54.png" alt="截屏2020-07-23 下午4.28.54" style="zoom:50%;" />

目前全球通过SSL进行的网上交易每年以超过数百亿美元。但SSL还缺少一些措施来防止在互联网商务中出现各种可能的欺骗行为

### 应用层安全协议

限于篇幅，我们在这一节仅讨论应用层中有关电子邮件的安全协议

电子邮件在传送过程中可能要经过许多路由器，其中的任何一个路由器都有可能对转发的邮件进行阅读。从这个意义上讲，电子邮件是没有什么隐私可言的

电子邮件这种网络应用有其特殊性，发送电子邮件是个即时的行为。A和B并不会为此建立任何会话。单向报文的安全问题

PGP

P347

PGP很难被攻破，因此在目前可以认为PGP是足够安全的

## 系统安全：防火墙与入侵检测

加密技术并不能阻止植入了特洛伊木马的计算机系统通过网络向攻击者泄漏秘密信息

### 防火墙

访问控制技术，严格控制进出网络边界的分组，禁止任何不必要的通信，从而减少潜在入侵的发生，尽可能降低这类安全威胁所带来的安全风险。由于防火墙不可能阻止所有入侵行为，作为系统防御的第二道防线，入侵检测系统IDS通过对进入网络的分组进行深度分析与检测发现疑似入侵行为的网络活动，并进行报警以便进一步采取相应措施

防火墙是一种特殊编程的路由器，安装在一个网点和网络的其余部分之间，目的是实施访问控制策略

<img src="/Users/yurunjie/Library/Application Support/typora-user-images/截屏2020-07-23 下午4.42.04.png" alt="截屏2020-07-23 下午4.42.04" style="zoom:50%;" />

防火墙技术一般分为以下两类

（1）分组过滤路由器是一种具有分组过滤功能的路由器，他根据过滤规则对进出内部网络的分组执行转发或者丢弃（即过滤）。过滤规则是基于分组的网络层或运输层首部的信号，例如：源/目的IP地址、源/目的端口、协议类型，等等

分组过滤可以是无状态的，即独立的处理每一个分组。也可以是有状态的，即要跟踪每个连接或会话的通信状态并根据这些状态信息来决定是否转发分组

分组过滤路由器的优点是简单高效，且对于用户是透明的，但不能对高层数据进行过滤。例如，不能禁止用户对某个特定应用的进行某个特定的操作，不能支持用户层用户鉴别等。这些功能要通过使用应用网关技术来实现的

（2）应用网关也称为代理服务器，他在应用层通信中扮演报文中继的角色。一种网络应用需要一个应用网关。在应用网关中可以实现基于应用层数据的过滤和高层用户鉴别

所有进出网络的应用程序报文都必须通过应用网关。应用网关在应用层打开该报文。应用网关也有一些缺点，首先，每种应用都需要一个不同的应用网关（可以运行在同一台主机上）。其次，在应用层转发和处理报文，处理负担较重。另外，对应用程序不透明，需要在应用程序客户端配置应用网关地址

通常可将这两种技术相结合

### 入侵检测系统

IDS

基于特征的入侵检测 已知攻击标志性特征

基于异常的入侵检测 网络流量统计等

误报

漏报

## 一些未来的发展方向

1、椭圆曲线密码 ECC

与AES这一系统现在已广泛用于电子护照，也是下一代金融系统使用的加密系统

2、移动安全

3、量子密码

量子计算机的到来将使得目前许多使用中的密码技术无效