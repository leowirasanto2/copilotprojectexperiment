//
//  NewsCategory.swift
//  CopilotProjectExperiment
//
//  Created by Leo Wirasanto Laia on 22/02/25.
//

import Foundation

struct NewsCategory: Identifiable {
    let id = UUID()
    let name: String
    let iconName: String
}

extension NewsCategory {
    static let dummyNewsCategoryList: [NewsCategory] = [
        NewsCategory(name: "Technology", iconName: "desktopcomputer"),
        NewsCategory(name: "Business", iconName: "briefcase"),
        NewsCategory(name: "Entertainment", iconName: "film"),
        NewsCategory(name: "Health", iconName: "heart"),
        NewsCategory(name: "Science", iconName: "flask"),
        NewsCategory(name: "Sports", iconName: "sportscourt")
    ]
}
