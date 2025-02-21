//
//  NewsListView.swift
//  CopilotProjectExperiment
//
//  Created by Leo Wirasanto Laia on 22/02/25.
//

import SwiftUI

struct NewsListView: View {
    @State private var isLoading = false
    @State private var listData: [NewsItem] = NewsItem.dummyNewsList

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(listData) { newsItem in
                    NewsListItemView(newsItem: newsItem)
                }
            }
            .padding()
        }
    }
}

#Preview {
    NewsListView()
}
