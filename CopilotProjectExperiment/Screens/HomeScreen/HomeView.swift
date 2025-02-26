//
//  HomeView.swift
//  CopilotProjectExperiment
//
//  Created by Leo Wirasanto Laia on 22/02/25.
//
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model: HomeModel
    @Namespace private var navigationZoomStyle
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        // Headline Section
                        if let headlineNews = model.headlineNews {
                            Text("Headline")
                                .font(.headline)
                                .padding(.horizontal)
                            NavigationLink(destination: NewsDetailScreen(newsItem: headlineNews, nameSpace: navigationZoomStyle)
                            ) {
                                HeadlineNewsView(
                                    imageUrl: URL(string: headlineNews.newsImageUrls.first ?? "")!,
                                    title: headlineNews.title,
                                    subtitle: headlineNews.description,
                                    publishedDate: headlineNews.publishedDate
                                )
                            }
                        }

                        // Category Section
                        Text("Categories")
                            .font(.headline)
                            .padding(.horizontal)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 8) {
                                ForEach(model.newsCategories) { category in
                                    CategoryChipView(category: category)
                                }
                            }
                            .padding(.horizontal)
                        }

                        // Latest News List Section
                        Text("Latest News")
                            .font(.headline)
                            .padding(.horizontal)
                        ForEach(model.newsItems) { newsItem in
                            NavigationLink(destination: NewsDetailScreen(newsItem: newsItem, nameSpace: navigationZoomStyle)) {
                                NewsListItemView(newsItem: newsItem)
                                    .padding(.horizontal)
                            }
                            .foregroundStyle(.primary)
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
            .task {
                await model.fetchNews()
                await model.fetchNewsSources()
                await model.fetchHeadlineNews()
                model.fetchNewsCategories()
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(HomeModel(repository: NewsRepositoryImpl()))
}
