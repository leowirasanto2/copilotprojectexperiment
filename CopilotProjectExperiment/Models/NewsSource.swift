//
//  NewsSource.swift
//  CopilotProjectExperiment
//
//  Created by Leo Wirasanto Laia on 27/02/25.
//

import Foundation

struct NewsSourceResponse: Codable {
    let status: String?
    let sources: [NewsSource]?
}

struct NewsSource: Codable {
    let id: String?
    let name: String?
    let description: String?
    let url: String?
    let category: String?
    let language: String?
    let country: String?
}
