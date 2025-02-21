//
//  NewsListItemView.swift
//  CopilotProjectExperiment
//
//  Created by Leo Wirasanto Laia on 21/02/25.
//

import SwiftUI

struct NewsListItemView: View {
    var newsItem: NewsItem
    
    var body: some View {
        HStack(spacing: 16) {
            AsyncImage(url: URL(string: "https://picsum.photos/100")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            } placeholder: {
                ProgressView()
                    .frame(width: 100, height: 100)
            }
            
            VStack(alignment: .leading) {
                Text(newsItem.title)
                    .font(.title2)
                    .lineLimit(1)
                Text(newsItem.date)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Text(newsItem.description)
                    .font(.subheadline)
                    .lineLimit(3)
            }
        }
    }
}

#Preview {
    NewsListItemView(newsItem: .dummyNewsItem)
}
