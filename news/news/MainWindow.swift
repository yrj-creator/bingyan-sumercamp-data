import SwiftUI

struct mainWindow: View {
    var modelViem: NewsModelViem
    
    var navigationButton: some View {
        HStack{
            Button(action: {self.modelViem.changeShowFocusOnOnly1()}) {
                Text("推荐")
                }
            Button(action: {self.modelViem.changeShowFocusOnOnly2()}) {
                Text("关注")
            }
        }
        .font(.title)
        .foregroundColor(.black)
        .offset(y: 9)
    }
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(0..<1) { index  in
                        var news = self.modelViem.model.news[0]
                        if news.isFocusOn || !self.modelViem.showFocusOnOnly {
                            NavigationLink(destination: newsContent(news: news)) {
                                newsRow(news: news)
                            }
                        }
                        Divider()
                    }
                }
//                .navigationBarHidden(true)
//                .navigationBarTitle(Text("Home"))
                .offset(x: -7,y: -18)
                .navigationBarItems(leading: navigationButton)
                .onAppear{
                    UITableView.appearance().separatorColor = .clear
                }
            }
        }
    }
}



struct mainWindow_Previews: PreviewProvider {
    static var previews: some View {
        mainWindow(modelViem: NewsModelViem())
    }
}

