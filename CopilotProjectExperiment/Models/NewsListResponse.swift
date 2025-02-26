//
//  NewsListResponse.swift
//  CopilotProjectExperiment
//
//  Created by Leo Wirasanto Laia on 27/02/25.
//

import Foundation

struct NewsListResponse: Codable {
    let status: String
    let totalResults: Int?
    let articles: [Article]?
}

struct Article: Codable {
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

struct Source: Codable {
    let id: String?
    let name: String?
}

extension Article {
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let publishedAt, let date = formatter.date(from: publishedAt) else { return "" }
        
        formatter.dateFormat = "MMM d, yyyy"
        return formatter.string(from: date)
    }
    
    func convertToNewsItem() -> NewsItem {
        return NewsItem(
            title: title ?? "-",
            date: formattedDate,
            description: description ?? "-",
            author: author ?? "-",
            newsImageUrls: urlToImage != nil ? [urlToImage!] : [],
            publishedDate: formattedDate,
            newsBody: content ?? "-"
        )
    }
}

extension NewsListResponse {
    var newsItems: [NewsItem] {
        if let articles = articles {
            return articles.compactMap { $0.convertToNewsItem() }
        }
        return []
    }
}
