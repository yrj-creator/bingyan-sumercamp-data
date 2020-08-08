import SwiftUI

class NewsModelView: ObservableObject {
    @Published var newsModel: NewsModel
    
    init() {
        let data = NewsData()
        newsModel = NewsModel(count: data.count, showFocusOnOnly: false, fuction: creatNews)
    }
    
}

func creatNews(index: Int) -> NewsModel.NewsDetail {
    let data = NewsData()
    return NewsModel.NewsDetail(id: index, title: data.title[index], kindOfNews: data.kindOfNews[index], pictures: data.pictures[index], author: data.author[index], time: data.time[index], headPortrait: data.headPortrait[index], authorTitle: data.authorTitle[index], paragraphs: data.paragraphs[index], kindOfParagraphs: data.kindOfParagraphs[index], comments: data.comments[index], associated: data.asssociated[index], isFocusOn: data.isFocusOn[index], isLiked: data.isLiked[index])
}
