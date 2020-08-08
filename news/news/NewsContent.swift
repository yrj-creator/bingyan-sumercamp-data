//
//  NewsContent.swift
//  news
//
//  Created by 余润杰 on 2020/8/7.
//  Copyright © 2020 余润杰. All rights reserved.
//

import SwiftUI

extension NewsModel {
    func theIndexOfNews(theNews : NewsModel.NewsDetail) -> Int {
        var i = 0
        for temp in news {
            if temp.id == theNews.id {
                break
            }
            i += 1
        }
        return i
    }
}

struct NewsContent: View {
    var news: NewsModel.NewsDetail
    @ObservedObject var mv: NewsModelView
    @State var a:String = ""
    
    var body: some View {
        ZStack {
            TextField("写评论...", text: $a)
                .frame(width: 150, height: 35)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .zIndex(5)
                .position(x: 100, y: 525)
            Rectangle()
                .fill()
                .frame(width: 400, height: 50)
                .foregroundColor(.white)
                .zIndex(2)
                .position(x: 200, y: 525)
            Rectangle()
                .stroke(lineWidth: 2)
                .frame(width: 400, height: 50)
                .foregroundColor(.black)
                .zIndex(2)
                .position(x: 200, y: 525)
            Button(action: {
                self.mv.newsModel.addComments(index: self.mv.newsModel.theIndexOfNews(theNews: self.news), content: self.a)
                self.a = ""
            }) {
                Text("发布")
            }
            .zIndex(3)
            .position(x: 200, y: 525)
            Button(action: { self.mv.newsModel.changeLiked(index: self.mv.newsModel.theIndexOfNews(theNews: self.news)) }) {
                if mv.newsModel.news[mv.newsModel.theIndexOfNews(theNews: news)].isLiked {
                    Image(systemName: "star.fill")
                    .foregroundColor(Color.yellow)
                } else {
                    Image(systemName: "star")
                    .foregroundColor(.gray)
                }
                Text("喜欢")
                    .foregroundColor(.black)
            }
            .position(x: 329, y: 525)
            .zIndex(10)
            List {
                VStack(alignment: .center) {
                    Text(news.title)
                        .font(.largeTitle)
                        .frame(width: 370)
                        .offset(x: -28)
                    HStack {
                        Image(news.headPortrait)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 3))
                        VStack(alignment: .leading) {
                            Text(news.author)
                            Text(news.authorTitle)
                                .foregroundColor(.gray)
                                .font(.footnote)
                        }
                        Spacer()
                        Button(action: { self.mv.newsModel.changeFocusOn(index: self.mv.newsModel.theIndexOfNews(theNews: self.news)) }) {
                            ZStack{
                                RoundedRectangle(cornerRadius: 4)
                                    .foregroundColor(.red)
                                    .frame(width: 60, height: 30)
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(lineWidth: 0.2)
                                    .foregroundColor(.black)
                                    .frame(width: 60, height: 30)
                                if mv.newsModel.news[mv.newsModel.theIndexOfNews(theNews: news)].isFocusOn {
                                    Text("已关注")
                                    .foregroundColor(.black)
                                } else {
                                    Text("关注")
                                    .foregroundColor(.black)
                                }
                            }
                        }
                        .offset(x: -80)
                    }
                    .offset(x:-15)
                }
                .padding()
                ForEach(0..<news.paragraphs.count) { index in
                    if self.news.kindOfParagraphs[index] == 2 {
                        Image(self.news.paragraphs[index])
                            .resizable()
                            .frame(width: 300, height: 300)
                            .offset(x: 5)
                               
                    } else if self.news.kindOfParagraphs[index] == 1 {
                        Text(self.news.paragraphs[index])
                    } else {
                        Text(self.news.paragraphs[index])
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                }
                Divider()
                ForEach(0..<news.associated.count) { index in
                    if self.news.kindOfNews == 1 {
                        AssociatedTextNewsRow(news: self.mv.newsModel.news[self.news.associated[index]])
                            .offset(x: -10)
                    } else {
                        AssociatedPictureNewsRow(news: self.mv.newsModel.news[self.news.associated[index]])
                            .offset(x: -10)
                    }
                    Divider()
                }
                ForEach(0..<mv.newsModel.news[self.mv.newsModel.theIndexOfNews(theNews: news)].comments.count) { index in
                    HStack {
                        Text("评论\(index+1)：")
                        Text(self.mv.newsModel.news[self.mv.newsModel.theIndexOfNews(theNews: self.news)].comments[index])
                    }
                    Divider()
                }
                Spacer()
            }
            .onAppear {
                UITableView.appearance().separatorColor = .clear
            }
            .offset(x: 8)
        }
    }
}

struct NewsContent_Previews: PreviewProvider {
    static var previews: some View {
        NewsContent(news: NewsModelView().newsModel.news[1], mv: NewsModelView())
    }
}
