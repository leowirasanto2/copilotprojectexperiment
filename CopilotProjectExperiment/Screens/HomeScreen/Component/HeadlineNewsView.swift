//
//  HeadlineNewsView.swift
//  CopilotProjectExperiment
//
//  Created by Leo Wirasanto Laia on 22/02/25.
//
import SwiftUI

struct HeadlineNewsView: View {
    let imageUrl: URL
    let title: String
    let subtitle: String
    let publishedDate: String

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: imageUrl) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipped()
            } placeholder: {
                ProgressView()
                    .frame(height: 200)
            }
            .cornerRadius(10)
            .padding(.horizontal)

            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.white)
                Text(publishedDate)
                    .font(.caption)
                    .foregroundColor(.white)
            }
            .padding()
            .background(Color.black.opacity(0.6))
            .cornerRadius(10)
            .padding(.horizontal)
        }
    }
}

#Preview {
    HeadlineNewsView(
        imageUrl: URL(string: "https://picsum.photos/200/300")!,
        title: "Sample Title",
        subtitle: "Sample Subtitle",
        publishedDate: "Feb 22, 2025"
    )
}
