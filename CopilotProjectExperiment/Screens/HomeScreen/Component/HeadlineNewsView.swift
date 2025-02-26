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
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 200)
            }
            .cornerRadius(10)
            .padding(.horizontal)

            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                    .lineLimit(1)
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                Text(publishedDate)
                    .font(.caption)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color.black.opacity(0.6))
            .clipShape(UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 10, bottomTrailing: 10)))
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
