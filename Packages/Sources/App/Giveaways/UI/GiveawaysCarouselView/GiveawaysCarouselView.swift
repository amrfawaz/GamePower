//
//  GiveawaysCarouselView.swift
//
//
//  Created by AmrFawaz on 17/05/2024.
//

import SwiftUI
import CoreInterface

struct GiveawaysCarouselView: View {
    @ObservedObject private var viewModel: GiveawaysCarouselViewModel

    init(viewModel: GiveawaysCarouselViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        TabView {
            ForEach(viewModel.giveaways) { giveaway in
                GeometryReader { proxy in
                    GiveawayView(
                        viewModel: GiveawayViewModel(
                            giveaway: giveaway,
                            cardType: .carousel
                        )
                    )
                    .rotation3DEffect(
                        .degrees(proxy.frame(in: .global).minX / -10), axis: (x: 0, y: 1, z: 0))
                }
            }
        }
        .frame(height: Style.Size.carouselViewHeight)
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}

#Preview {
    GiveawaysCarouselView(
        viewModel: GiveawaysCarouselViewModel(
            giveaways: GiveawaysCarouselViewModel.mockedGiveaways
        )
    )
}
