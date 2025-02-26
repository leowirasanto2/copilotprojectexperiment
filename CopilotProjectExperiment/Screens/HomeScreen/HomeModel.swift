//
//  HomeModel.swift
//  CopilotProjectExperiment
//
//  Created by Leo Wirasanto Laia on 27/02/25.
//

import Foundation

class HomeModel: ObservableObject {
    @Published var newsItems: [NewsItem] = []
    @Published var newsCategories: [NewsCategory] = []
    @Published var newsSources: [NewsSource] = []
    @Published var headlineNews: NewsItem?
    
    private let repository: NewsRepository
    
    init(repository: NewsRepository) {
        self.repository = repository
    }
    
    func fetchHeadlineNews() async {
        let response = try? await repository.fetchHeadlineNews()
        
        if let response {
            DispatchQueue.main.async {
                self.headlineNews = response.newsItems.first
            }
        }
    }
    
    func fetchNews() async {
        let response = try? await repository.fetchNewsList()
        
        if let response {
            DispatchQueue.main.async {
                self.newsItems = response.newsItems
            }
        }
    }
    
    func fetchNewsCategories() {
        newsCategories = NewsCategory.dummyNewsCategoryList
    }
    
    func fetchNewsSources() async {
        let response = try? await repository.fetchNewsSources()
        
        if let response {
            DispatchQueue.main.async {
                self.newsSources = response.sources ?? []
            }
        }
    }
}
