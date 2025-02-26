//
//  ContentView.swift
//  CopilotProjectExperiment
//
//  Created by Leo Wirasanto Laia on 21/02/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HomeView()
                .environmentObject(HomeModel(repository: NewsRepositoryImpl()))
        }
    }
}

#Preview {
    ContentView()
}
