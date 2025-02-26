import Foundation

enum Endpoints: String {
    case headlines = "/top-headlines"
    case latestNews = "/everything"
    case newsSources = "/top-headlines/sources"
}

protocol NewsRepository {
    func fetchNewsList() async throws -> NewsListResponse
    func fetchHeadlineNews() async throws -> NewsListResponse
    func fetchNewsSources() async throws -> NewsSourceResponse
}

class NewsRepositoryImpl: NewsRepository {
    private let baseURL: String
    private let apiKey: String
    
    init() {
        if let baseUrl = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String {
            self.baseURL = "https://" + baseUrl
        } else {
            self.baseURL = "failed get base url"
        }
        
        if let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String {
            self.apiKey = apiKey
        } else {
            self.apiKey = "failed get api key"
        }
    }
    
    func fetchNewsList() async throws -> NewsListResponse {
        guard let url = URL(string: "\(baseURL)\(Endpoints.latestNews.rawValue)?apiKey=\(apiKey)&q=worldnews") else {
            throw NSError(domain: "Invalid URL", code: -1, userInfo: nil)
        }
        return try await fetcher(from: url)
    }
    
    func fetchHeadlineNews() async throws -> NewsListResponse {
        guard let url = URL(string: "\(baseURL)\(Endpoints.headlines.rawValue)?apiKey=\(apiKey)&pageSize=5&country=us") else {
            throw NSError(domain: "Invalid URL", code: -1, userInfo: nil)
        }
        return try await fetcher(from: url)
    }
    
    func fetchNewsSources() async throws -> NewsSourceResponse {
        guard let url = URL(string: "\(baseURL)\(Endpoints.newsSources.rawValue)?apiKey=\(apiKey)") else {
            throw NSError(domain: "Invalid URL", code: -1, userInfo: nil)
        }
        return try await fetcher(from: url)
    }
    
    func fetcher<T: Codable>(from url: URL) async throws -> T {
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        return decodedData
    }
}
