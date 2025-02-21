//
//  CategoryChipView.swift
//  CopilotProjectExperiment
//
//  Created by Leo Wirasanto Laia on 22/02/25.
//


import SwiftUI

struct CategoryChipView: View {
    let category: NewsCategory

    var body: some View {
        HStack {
            Image(systemName: category.iconName)
            Text(category.name)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(16)
    }
}

#Preview {
    CategoryChipView(category: NewsCategory(name: "Technology", iconName: "desktopcomputer"))
}
