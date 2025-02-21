//
//  HomeView.swift
//  CopilotProjectExperiment
//
//  Created by Leo Wirasanto Laia on 22/02/25.
//
import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        // Headline Section
                        Text("Headline")
                            .font(.headline)
                            .padding(.horizontal)
                        NavigationLink(destination: NewsDetailScreen(newsItem: NewsItem.dummyNewsItem)) {
                            HeadlineNewsView(
                                imageUrl: URL(string: "https://picsum.photos/200/300")!,
                                title: "Sample Title",
                                subtitle: "Sample Subtitle",
                                publishedDate: "Feb 22, 2025"
                            )
                        }

                        // Category Section
                        Text("Categories")
                            .font(.headline)
                            .padding(.horizontal)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 8) {
                                ForEach(NewsCategory.dummyNewsCategoryList) { category in
                                    CategoryChipView(category: category)
                                }
                            }
                            .padding(.horizontal)
                        }

                        // Latest News List Section
                        Text("Latest News")
                            .font(.headline)
                            .padding(.horizontal)
                        ForEach(NewsItem.dummyNewsList) { newsItem in
                            NavigationLink(destination: NewsDetailScreen(newsItem: newsItem)) {
                                NewsListItemView(newsItem: newsItem)
                                    .padding(.horizontal)
                            }
                        }
                    }
                }
                Spacer()
            }
            .navigationTitle("Copilot Newsletter")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(trailing: NavigationLink(destination: SearchNewsScreen()) {
                Image(systemName: "magnifyingglass")
            })
        }
    }
}

#Preview {
    HomeView()
}
