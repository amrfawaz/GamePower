//
//  GiveawaysView.swift
//  
//
//  Created by AmrFawaz on 13/05/2024.
//

import SwiftUI
import CoreInterface

public struct GiveawaysView: View {
    @StateObject private var viewModel = GiveawaysViewModel()

    public init() {}

    public var body: some View {
        content
            .padding(.vertical, Style.Spacing.md)
            .onAppear {
                Task {
                    await viewModel.fetchGiveaways()
                }
            }
    }
}

// MARK: - Private Views

private extension GiveawaysView {
    private var content: some View {
        ScrollView {
            VStack(spacing: Style.Spacing.md) {
                carouselView
                segmentedView
                    .padding(.horizontal, Style.Spacing.md)
                list
                
            }
        }
    }

    private var carouselView: some View {
        GiveawaysCarouselView(viewModel: GiveawaysCarouselViewModel(giveaways: viewModel.giveaways))
    }

    private var segmentedView: some View {
        ScrollView(.horizontal) {
            HStack(
                alignment: .center,
                spacing: Style.Spacing.md
            ) {
                ForEach(viewModel.platforms, id: \.self) { platform in
                    ViewThatFits {
                        Text(platform)
                            .typography(.button01)
                            .foregroundStyle(platform == viewModel.selectedPlatform ? .black : .gray)
                            .onTapGesture {
                                viewModel.didTapPlatform(platform: platform)
                            }
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
    }

    private var list: some View {
        LazyVStack(spacing: 0) {
            ForEach(viewModel.filter()) { giveaway in
                GiveawayView(
                    viewModel: GiveawayViewModel(
                        giveaway: giveaway,
                        cardType: .list
                    )
                )
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets())
            }
        }
    }
}

#Preview {
    GiveawaysView()
}
