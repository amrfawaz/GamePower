//
//  GiveawaysView.swift
//  
//
//  Created by AmrFawaz on 13/05/2024.
//

import SwiftUI

public struct GiveawaysView: View {
    @StateObject private var viewModel = GiveawaysViewModel()

    public init() {}

    public var body: some View {
        content
            .onAppear {
                Task {
                    await viewModel.fetchGiveaways()
                }
            }
    }
}

// MARK: - Private Views

private extension GiveawaysView {
    var content: some View {
        list
    }

    var list: some View {
        Text("Test")
    }

}

#Preview {
    GiveawaysView()
}
