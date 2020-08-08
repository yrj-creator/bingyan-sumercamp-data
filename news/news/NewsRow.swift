import SwiftUI

struct TextNewsRow: View {
    var news: NewsModel.NewsDetail
    
    var body: some View {
        VStack {
            Text(news.title)
                .font(.title)
            HStack {
                Text(news.author)
                Text(news.time)
                Spacer()
            }
            .offset(x: 15)
            .font(.callout)
            .padding()
            .foregroundColor(.gray)
        }
    }
}

struct PictureNewsRow: View {
    var news: NewsModel.NewsDetail
            
    var body: some View {
        VStack {
            Text(news.title)
                .font(.title)
            HStack() {
                Image(news.pictures[0])
                .resizable()
                .frame(width: 100, height: 100)
                Image(news.pictures[1])
                .resizable()
                .frame(width: 100, height: 100)
                Image(news.pictures[2])
                .resizable()
                .frame(width: 100, height: 100)
            }
            .offset(x: -10)
            HStack {
                Text(news.author)
                Text(news.time)
                Spacer()
            }
            .font(.callout)
            .padding()
            .foregroundColor(.gray)
        }
        .padding()
    }
}

struct AssociatedTextNewsRow: View {
    var news: NewsModel.NewsDetail
    
    var body: some View {
        VStack {
            Text(news.title)
                .font(.title)
            HStack {
                Text(news.author)
                Text(news.time)
                Spacer()
            }
            .offset(x: 8)
            .font(.callout)
            .padding()
            .foregroundColor(.gray)
        }
    }
}

struct AssociatedPictureNewsRow: View {
    var news: NewsModel.NewsDetail
    
    var body: some View {
        VStack {
            HStack {
                Text(news.title)
                    .font(.title)
                Image(news.pictures[0])
                .resizable()
                    .frame(width: 100, height: 100)
            }
            HStack {
                Text(news.author)
                Text(news.time)
                Spacer()
            }
            .offset(x: 10)
            .font(.callout)
            .foregroundColor(.gray)
        }
    .padding()
    }
}



struct NewsRow_Previews: PreviewProvider {
    static var previews: some View {
        AssociatedPictureNewsRow(news: NewsModelView().newsModel.news[1])
    }
}
