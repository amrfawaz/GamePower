//
//  GiveawaysView.swift
//  
//
//  Created by AmrFawaz on 13/05/2024.
//

import SwiftUI
import CoreInterface

public struct GiveawaysView: View {
    @StateObject private var viewModel = GiveawaysViewModel(
        services: DefaultGiveawaysService()
    )
    @State private var path = NavigationPath()

    public init() {}

    public var body: some View {
        NavigationStack(path: $path) {
            content
                .padding(.vertical, Style.Spacing.md)
                .onAppear {
                    Task {
                        await viewModel.fetchGiveaways()
                    }
                }
        }
    }
}

// MARK: - Private Views

private extension GiveawaysView {
    private var content: some View {
        ScrollView {
            VStack(spacing: Style.Spacing.md) {
                title
                carouselView
                segmentedView
                    .padding(.horizontal, Style.Spacing.md)
                list
            }
        }
    }

    var title: some View {
        Text("Explore Games Giveaways")
            .typography(.heading01)
            .foregroundStyle(.black)
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
                NavigationLink(value: giveaway) {
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
        .navigationDestination(for: Giveaway.self) { giveaway in
            GiveawayDetailsView(
                viewModel: GiveawayDetailsViewModel(giveaway: giveaway),
                path: $path
            )
        }
    }
}

#Preview {
    GiveawaysView()
}
