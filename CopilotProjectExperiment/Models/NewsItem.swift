import Foundation

struct NewsItem: Identifiable, Codable {
    let id: String
    let title: String
    let date: String
    let description: String
    let author: String
    let newsImageUrls: [String]
    let publishedDate: String
    let newsBody: String
    
    init(id: String? = nil, title: String, date: String, description: String, author: String, newsImageUrls: [String], publishedDate: String, newsBody: String) {
        self.id = id ?? UUID().uuidString
        self.title = title
        self.date = date
        self.description = description
        self.author = author
        self.newsImageUrls = newsImageUrls
        self.publishedDate = publishedDate
        self.newsBody = newsBody
    }
}

extension NewsItem {
    static let dummyNewsList: [NewsItem] = [
        NewsItem(title: "Breaking News: Market Hits Record Highs", date: "March 1, 2025", description: "The stock market reached an all-time high today, with major indices showing significant gains.", author: "John Doe", newsImageUrls: generateRandomImageUrls(), publishedDate: "March 1, 2025", newsBody: generateRandomNewsBody()),
        NewsItem(title: "Sports Update: Local Team Wins Championship", date: "March 2, 2025", description: "In an exciting final match, the local team clinched the championship title.", author: "Jane Smith", newsImageUrls: generateRandomImageUrls(), publishedDate: "March 2, 2025", newsBody: generateRandomNewsBody()),
        NewsItem(title: "Weather Alert: Severe Storms Expected", date: "March 3, 2025", description: "Meteorologists are predicting severe storms in the region, with potential for heavy rain and strong winds.", author: "Mike Johnson", newsImageUrls: generateRandomImageUrls(), publishedDate: "March 3, 2025", newsBody: generateRandomNewsBody()),
        NewsItem(title: "Tech News: New Smartphone Released", date: "March 4, 2025", description: "The latest smartphone model has been released, featuring cutting-edge technology and innovative features.", author: "Emily Davis", newsImageUrls: generateRandomImageUrls(), publishedDate: "March 4, 2025", newsBody: generateRandomNewsBody()),
        NewsItem(title: "Health Update: New Vaccine Approved", date: "March 5, 2025", description: "A new vaccine has been approved for use, promising to improve public health outcomes.", author: "Chris Brown", newsImageUrls: generateRandomImageUrls(), publishedDate: "March 5, 2025", newsBody: generateRandomNewsBody()),
        NewsItem(title: "Entertainment: Award Show Highlights", date: "March 6, 2025", description: "The annual award show featured memorable performances and surprise winners.", author: "Sarah Wilson", newsImageUrls: generateRandomImageUrls(), publishedDate: "March 6, 2025", newsBody: generateRandomNewsBody()),
        NewsItem(title: "Travel: Top Destinations for 2025", date: "March 7, 2025", description: "Travel experts have listed the top destinations to visit in 2025, offering a variety of experiences.", author: "David Lee", newsImageUrls: generateRandomImageUrls(), publishedDate: "March 7, 2025", newsBody: generateRandomNewsBody()),
        NewsItem(title: "Finance: Tips for Saving Money", date: "March 8, 2025", description: "Financial advisors share their top tips for saving money and managing personal finances.", author: "Laura Martinez", newsImageUrls: generateRandomImageUrls(), publishedDate: "March 8, 2025", newsBody: generateRandomNewsBody()),
        NewsItem(title: "Education: New Online Learning Platforms", date: "March 9, 2025", description: "Several new online learning platforms have been launched, providing more options for remote education.", author: "James Anderson", newsImageUrls: generateRandomImageUrls(), publishedDate: "March 9, 2025", newsBody: generateRandomNewsBody()),
        NewsItem(title: "Science: New Discovery in Space", date: "March 10, 2025", description: "Astronomers have discovered a new celestial body in the outer reaches of the solar system.", author: "Patricia Thomas", newsImageUrls: generateRandomImageUrls(), publishedDate: "March 10, 2025", newsBody: generateRandomNewsBody()),
        NewsItem(title: "Politics: Election Results Announced", date: "March 11, 2025", description: "The results of the recent election have been announced, with significant changes in the political landscape.", author: "Robert Jackson", newsImageUrls: generateRandomImageUrls(), publishedDate: "March 11, 2025", newsBody: generateRandomNewsBody()),
        NewsItem(title: "Economy: Inflation Rates Rising", date: "March 12, 2025", description: "Economists are warning about rising inflation rates and their potential impact on the economy.", author: "Linda White", newsImageUrls: generateRandomImageUrls(), publishedDate: "March 12, 2025", newsBody: generateRandomNewsBody()),
        NewsItem(title: "Health: New Fitness Trends", date: "March 13, 2025", description: "The latest fitness trends are gaining popularity, with new workout routines and health tips.", author: "Barbara Harris", newsImageUrls: generateRandomImageUrls(), publishedDate: "March 13, 2025", newsBody: generateRandomNewsBody()),
        NewsItem(title: "Technology: Advances in AI", date: "March 14, 2025", description: "Recent advances in artificial intelligence are revolutionizing various industries.", author: "Paul Clark", newsImageUrls: generateRandomImageUrls(), publishedDate: "March 14, 2025", newsBody: generateRandomNewsBody()),
        NewsItem(title: "Environment: Conservation Efforts", date: "March 15, 2025", description: "New conservation efforts are being implemented to protect endangered species.", author: "Jennifer Lewis", newsImageUrls: generateRandomImageUrls(), publishedDate: "March 15, 2025", newsBody: generateRandomNewsBody()),
        NewsItem(title: "Culture: Art Exhibition Opens", date: "March 16, 2025", description: "A new art exhibition has opened, showcasing works from contemporary artists.", author: "Mark Walker", newsImageUrls: generateRandomImageUrls(), publishedDate: "March 16, 2025", newsBody: generateRandomNewsBody()),
        NewsItem(title: "Travel: Budget Travel Tips", date: "March 17, 2025", description: "Travel experts share their top tips for budget-friendly travel.", author: "Elizabeth Hall", newsImageUrls: generateRandomImageUrls(), publishedDate: "March 17, 2025", newsBody: generateRandomNewsBody()),
        NewsItem(title: "Food: New Restaurant Reviews", date: "March 18, 2025", description: "Food critics review the latest restaurant openings and culinary trends.", author: "Steven Allen", newsImageUrls: generateRandomImageUrls(), publishedDate: "March 18, 2025", newsBody: generateRandomNewsBody()),
        NewsItem(title: "Sports: Upcoming Sports Events", date: "March 19, 2025", description: "A preview of the upcoming sports events and matches to watch.", author: "Mary Young", newsImageUrls: generateRandomImageUrls(), publishedDate: "March 19, 2025", newsBody: generateRandomNewsBody()),
        NewsItem(title: "Lifestyle: Home Decor Ideas", date: "March 20, 2025", description: "Interior designers share their latest home decor ideas and trends.", author: "Michael King", newsImageUrls: generateRandomImageUrls(), publishedDate: "March 20, 2025", newsBody: generateRandomNewsBody())
    ]
    
    static let dummyNewsItem = NewsItem(title: "Breaking News: Market Hits Record Highs", date: "March 1, 2025", description: "The stock market reached an all-time high today, with major indices showing significant gains.", author: "John Doe", newsImageUrls: generateRandomImageUrls(), publishedDate: "March 1, 2025", newsBody: generateRandomNewsBody())
    
    static let dummyHeadlineNews: NewsItem = NewsItem(id: "12345", title: "Breaking News: Market Hits Record Highs", date: "March 1, 2025", description: "The stock market reached an all-time high today, with major indices showing significant gains.", author: "John Doe", newsImageUrls: generateRandomImageUrls(), publishedDate: "March 1, 2025", newsBody: generateRandomNewsBody())
    
    static let dummySearchResults: [NewsItem] = [
        NewsItem(title: "Search Result 1", date: "March 1, 2025", description: "Description for search result 1", author: "Jane Smith", newsImageUrls: generateRandomImageUrls(), publishedDate: "March 1, 2025", newsBody: generateRandomNewsBody()),
        NewsItem(title: "Search Result 2", date: "March 2, 2025", description: "Description for search result 2", author: "Mike Johnson", newsImageUrls: generateRandomImageUrls(), publishedDate: "March 2, 2025", newsBody: generateRandomNewsBody()),
        NewsItem(title: "Search Result 3", date: "March 3, 2025", description: "Description for search result 3", author: "Emily Davis", newsImageUrls: generateRandomImageUrls(), publishedDate: "March 3, 2025", newsBody: generateRandomNewsBody())
    ]
    
    static let dummyRelatedNews: [NewsItem] = [
        NewsItem(title: "Related News 1", date: "March 1, 2025", description: "Description for related news 1", author: "John Doe", newsImageUrls: generateRandomImageUrls(), publishedDate: "March 1, 2025", newsBody: generateRandomNewsBody()),
        NewsItem(title: "Related News 2", date: "March 2, 2025", description: "Description for related news 2", author: "Jane Smith", newsImageUrls: generateRandomImageUrls(), publishedDate: "March 2, 2025", newsBody: generateRandomNewsBody()),
        NewsItem(title: "Related News 3", date: "March 3, 2025", description: "Description for related news 3", author: "Mike Johnson", newsImageUrls: generateRandomImageUrls(), publishedDate: "March 3, 2025", newsBody: generateRandomNewsBody())
    ]
    
    static let dummySuggestions: [String] = [
        "Technology News",
        "Sports Updates",
        "Weather Alerts",
        "Health Tips",
        "Entertainment News",
        "Finance Updates",
        "Education Trends",
        "Science Discoveries",
        "Politics News",
        "Economic Insights"
    ]
    
    private static func generateRandomImageUrls() -> [String] {
        let count = Int.random(in: 2...4)
        return (1...count).map { _ in "https://picsum.photos/200/300" }
    }
    
    private static func generateRandomNewsBody() -> String {
        let paragraphCount = Int.random(in: 2...5)
        let paragraph = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        return (1...paragraphCount).map { _ in paragraph }.joined(separator: "\n\n")
    }
}
