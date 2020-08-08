import Foundation

struct NewsData {
    var count: Int = 2
    
    init() {
        // 文字新闻1
        title.append("字节跳动和微软，都发声了")
        kindOfNews.append(1)
        pictures.append([])
        author.append("人民政协网")
        time.append("8小时前")
        headPortrait.append("timg")
        authorTitle.append("人民作家")
        paragraphs.append(["近段时间，特朗普政府紧盯抖音海外版（TikTok）不放，甚至扬言要将之封禁。", "1_1", "8月2日深夜，TikTok母公司字节跳动在其官方微头条号上发文称：", "字节跳动始终致力于成为一家全球化公司。在这个过程中，**我们面临着各种复杂和难以想象的困难，包括紧张的国际政治环境、不同文化的碰撞与冲突、竞争对手Facebook的抄袭和抹黑**。但我们仍然坚守全球化的愿景，不断加大包括中国在内的全球各地市场的投入，为全球用户创造价值。**我们严格遵守当地法律，也会积极利用法律授予我们的权利，维护公司的合法权益**。", "1_2", "此外，美国微软公司也发声了。", "据央视新闻报道，微软公司的声明称，将继续寻求收购TikTok在美业务的可能性，这是微软首席执行官和特朗普讨论后作出的决定，微软将在几周内与字节跳动展开谈判。另据英国路透社报道，特朗普同意给字节跳动45天与微软协商出售TikTok事宜。", "1_3", "TikTok是一款移动短视频APP，主打娱乐休闲，据称下载量约20亿，用户群体从东亚遍及北美。", "来源：北京日报综合字节跳动官方微头条、央视新闻、北京日报·长安观察"])
        kindOfParagraphs.append([1, 2, 1, 1, 2, 1, 1, 2, 1, 4])
        comments.append(["dasds", "dad", "123sss"])
        asssociated.append([0, 0, 0])
        isFocusOn.append(false)
        isLiked.append(false)
        
        // 图片新闻1
        title.append("10元/瓶的饮料卖10元/箱！“临期食品”你会买吗？")
        kindOfNews.append(2)
        pictures.append(["timg1", "timg2", "timg3"])
        author.append("中国消费者报")
        time.append("5小时前")
        headPortrait.append("timg")
        authorTitle.append("头条青云获得者")
        paragraphs.append(["1升装的进口啤酒10元/桶", "日本进口麦片50元两大袋", "原价149元的德国进口牛奶只要99元", "……", "在超市、电商、APP等平台", "常常能见到接近保质期的食品", "以“白菜价”打折售卖", "这一模式一定程度上减少了浪费", "同时也为零售业带来新的机会", "**临期食品折扣店**", "**线上线下两开花**"])
        kindOfParagraphs.append([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1])
        comments.append(["13", "2311", "dadad"])
        asssociated.append([1, 1, 1])
        isFocusOn.append(false)
        isLiked.append(false)
        
    }

    var title: [String] = [String]()              // 新闻标题
    var kindOfNews: [Int] = [Int]()               // 新闻标题类型 1、文字 2、图片 3、视频
    var pictures: [[String]] = [[String]]()       // 新闻标题的图片或视频
    var author: [String] = [String]()             // 新闻作者
    var time: [String] = [String]()               // 新闻时间
    var headPortrait: [String] = [String]()       // 新闻作者头像
    var authorTitle: [String] = [String]()        // 新闻作者头衔
    var paragraphs: [[String]] = [[String]]()     // 新闻内容
    var kindOfParagraphs: [[Int]] = [[Int]]()     // 新闻内容种类 1、文字 2、图片 3、视频 4、小字 5、小标题
    var comments: [[String]] = [[String]]()       // 评论
    var asssociated: [[Int]] = [[Int]]()          // 关联
    var isFocusOn: [Bool] = [Bool]()              // 是否关注
    var isLiked: [Bool] = [Bool]()                // 是否喜欢
}
