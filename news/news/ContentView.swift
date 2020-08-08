import SwiftUI

struct ContentView: View {
    @ObservedObject var mv: NewsModelView = NewsModelView()
    
    var profileButton: some View {
        HStack {
            Button(action: { self.mv.newsModel.changeShowFocusOnOnly(index: 1) }) {
                Text("推荐")
            }
            Button(action: { self.mv.newsModel.changeShowFocusOnOnly(index: 2) }) {
                Text("关注")
            }
        }
        .font(.largeTitle)
        .foregroundColor(.black)
    }
    
    var body: some View {
        ZStack {
//            Button(action: {print(1)}) {
//                Text("推荐")
//            }
//            .zIndex(3)
//            .foregroundColor(.black)
//            .position(x: 120, y: 20)
//            .font(.title)
//            Button(action: {print(1)}) {
//                Text("关注")
//            }
//            .zIndex(3)
//            .foregroundColor(.black)
//            .position(x: 50, y: 20)
//            .font(.title)
//            Rectangle()
//                .fill()
//                .frame(width: 400, height: 100)
//                .foregroundColor(.white)
//                .zIndex(2)
//                .position(x: 200, y: 0)
//            Rectangle()
//                .stroke(lineWidth: 2)
//                .frame(width: 400, height: 100)
//                .foregroundColor(.black)
//                .zIndex(2)
//                .position(x: 200, y: 0)
//            Rectangle()
//                .fill()
//                .frame(width: 400, height: 50)
//                .foregroundColor(.white)
//                .zIndex(2)
//                .position(x: 200, y: 630)
//            Rectangle()
//                .stroke(lineWidth: 2)
//                .frame(width: 400, height: 50)
//                .foregroundColor(.black)
//                .zIndex(2)
//                .position(x: 200, y: 630)
            NavigationView {
                List {
                    ForEach(mv.newsModel.news) { news in
                        if news.isFocusOn || !self.mv.newsModel.showFocusOnOnly {
                            NavigationLink(
                                destination: NewsContent(news: news, mv: self.mv)
                            ) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10.0)
                                        .fill(Color.white)
                                        .frame(width: 400, height: 100)
                                        .zIndex(1)
                                    if news.kindOfNews == 1 {
                                        TextNewsRow(news: news)
                                            .offset(x: -20)
                                        .zIndex(2)
                                    } else if news.kindOfNews == 2 {
                                        PictureNewsRow(news: news)
                                            .offset(x:-20)
                                            .zIndex(2)
                                    } else {
                                        TextNewsRow(news: news)
                                    }
                                }
                            }
                        }
                    }
                    .offset(y: 20)
                }
                .navigationBarItems(leading: profileButton)
            }
            .offset(y: 0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

