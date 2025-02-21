//
//  SearchNewsScreen.swift
//  CopilotProjectExperiment
//
//  Created by Leo Wirasanto Laia on 22/02/25.
//
import SwiftUI

struct SearchNewsScreen: View {
    @State private var searchQuery: String = ""
    @State private var suggestions: [String] = []
    @State private var searchResults: [NewsItem] = []

    var body: some View {
        NavigationView {
            VStack {
                TextField("Search news...", text: $searchQuery)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .onChange(of: searchQuery) { newValue in
                        fetchSuggestions(for: newValue)
                        searchResults.removeAll()
                    }
                    .onSubmit {
                        performSearch(for: searchQuery)
                    }
                
                if !suggestions.isEmpty && searchResults.isEmpty {
                    ScrollView {
                        VStack(alignment: .leading) {
                            ForEach(suggestions, id: \.self) { suggestion in
                                Text(suggestion)
                                    .padding()
                                    .background(Color(.systemGray6))
                                    .cornerRadius(8)
                                    .onTapGesture {
                                        searchQuery = suggestion
                                        performSearch(for: suggestion)
                                    }
                            }
                        }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                
                if !searchResults.isEmpty {
                    ScrollView {
                        VStack(alignment: .leading) {
                            ForEach(searchResults) { item in
                                NewsListItemView(newsItem: item)
                                    .padding()
                                    .background(Color(.systemGray6))
                                    .cornerRadius(8)
                            }
                        }
                        .padding(.horizontal)
                    }
                } else {
                    Spacer()
                }
            }
            .navigationTitle("Search News")
        }
    }

    private func fetchSuggestions(for query: String) {
        // Simulate fetching suggestions
       
        suggestions = NewsItem.dummySuggestions.filter { $0.contains(query) }
    }

    private func performSearch(for query: String) {
        // Simulate fetching search results
        searchResults = NewsItem.dummySearchResults
        suggestions.removeAll()
    }
}

#Preview {
    SearchNewsScreen()
}
