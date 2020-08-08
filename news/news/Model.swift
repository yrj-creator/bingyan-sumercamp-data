import Foundation

struct NewsModel {
    var showFocusOnOnly: Bool = false
    var news: [NewsDetail] = [NewsDetail]()
    var count: Int
    
    init(count: Int, showFocusOnOnly: Bool, fuction: (Int) -> NewsDetail) {
        self.count = count
        self.showFocusOnOnly = showFocusOnOnly
        for index in 0..<count {
            news.append(fuction(index))
        }
    }
    
    mutating func changeLiked(index: Int) {
        news[index].isLiked = !news[index].isLiked
    }
    
    mutating func changeFocusOn(index: Int) {
        news[index].isFocusOn = !news[index].isFocusOn
    }
    
    mutating func changeShowFocusOnOnly(index: Int) {
        if index == 1 {
            showFocusOnOnly = false
        } else {
            showFocusOnOnly = true
        }
    }
    
    mutating func addComments(index: Int, content: String) {
        news[index].comments.append(content)
    }
    
    struct NewsDetail: Identifiable {
        var id: Int
        var title: String
        var kindOfNews: Int
        var pictures: [String]
        var author: String
        var time: String
        var headPortrait: String
        var authorTitle: String
        var paragraphs: [String]
        var kindOfParagraphs: [Int]
        var comments: [String]
        var associated: [Int]
        var isFocusOn: Bool
        var isLiked: Bool
    }
}
