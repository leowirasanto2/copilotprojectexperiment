//
//  NewsDetailScreen.swift
//  CopilotProjectExperiment
//
//  Created by Leo Wirasanto Laia on 22/02/25.
//
import SwiftUI

struct NewsDetailScreen: View {
    @State var newsItem: NewsItem
    var nameSpace: Namespace.ID

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Carousel for news images
                TabView {
                    ForEach(newsItem.newsImageUrls, id: \.self) { newsImageUrl in
                        AsyncImage(url: URL(string: newsImageUrl)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(height: 300)
                        .clipped()
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .frame(height: 300)

                // News title
                Text(newsItem.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)

                // Author and published date
                HStack {
                    Text("By \(newsItem.author)")
                    Spacer()
                    Text(newsItem.publishedDate)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.horizontal)

                // News body
                Text(newsItem.newsBody)
                    .font(.body)
                    .padding(.horizontal)

                // News suggestions
                Text("You might also like")
                    .font(.headline)
                    .padding(.horizontal)

                ForEach(NewsItem.dummyRelatedNews) { suggestion in
                    NavigationLink(destination: NewsDetailScreen(newsItem: suggestion, nameSpace: nameSpace)) {
                        NewsListItemView(newsItem: suggestion)
                            .padding(.horizontal)
                    }
                }
            }
        }
        .navigationTitle("News Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    @Previewable @Namespace var nameSpace
    NavigationView {
        NewsDetailScreen(newsItem: NewsItem.dummyNewsItem, nameSpace: nameSpace)
    }
}
