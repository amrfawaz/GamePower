//
//  GiveawayView.swift
//  
//
//  Created by AmrFawaz on 14/05/2024.
//

import SwiftUI
import CoreInterface

struct GiveawayView: View {
    @ObservedObject private var viewModel: GiveawayViewModel

    init(viewModel: GiveawayViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ZStack {
            backgroundImage
            overlayView
            content
                .padding(.all, Style.Spacing.md)
        }
        .frame(height: viewModel.cardType == .list ? Style.Size.listCardHeight : Style.Size.carouselCardHeight)
        .clipShape(.rect(cornerRadius: Style.Spacing.md))
        .padding(.horizontal, Style.Spacing.md)
        .padding(.top, Style.Spacing.sm)
    }

    var backgroundImage: some View {
        AsyncImage(
            url: URL(
                string: viewModel.giveaway.image
            )
        ) { image in
            image.resizable()
        } placeholder: {
            Color.gray
        }
    }

    var overlayView: some View {
        Rectangle()
            .foregroundStyle(.black)
            .opacity(0.7)
    }

    var content: some View {
        VStack(
            alignment: .leading,
            spacing: .zero
        ) {
            header
            description
        }
    }
}

// MARK: - Content Views

private extension GiveawayView {
    var header: some View {
        HStack(alignment: .top, spacing: Style.Spacing.xs) {
            title
                .foregroundStyle(.white)

            Spacer()

            if viewModel.cardType == .list {
                heartButton
                    .frame(minHeight: Style.Size.heartButtonHeight, maxHeight: Style.Size.heartButtonWidth)
            }
        }
    }

    var title: some View {
        Text(viewModel.giveaway.title)
            .typography(.heading02)
            .foregroundStyle(.white)
    }

    var heartButton: some View {
        Button(action: {
            viewModel.toggelStatus()
        }) {
            Image(systemName: viewModel.giveawayStatus ? "heart.fill" : "heart")
                .foregroundColor(.white)
                .font(.system(size: 30))
        }
    }

    var description: some View {
        VStack(
            alignment: .leading,
            spacing: .zero
        ) {
            if viewModel.cardType == .list {
                Text(viewModel.giveaway.platforms)
                    .typography(.caption01)
                    .foregroundStyle(.white)
                    .padding(.top, Style.Spacing.sm)
            }

            Spacer()

            Text(viewModel.giveaway.description)
                .typography(.body01)
                .foregroundStyle(.white)

        }
    }

}

// MARK: - Preview

#if DEBUG
struct GiveawayView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            giveaway(.mockCarouselCard)
            giveaway(.mockListCard)
        }
    }

    private static func giveaway(
        _ viewModel: GiveawayViewModel
    ) -> some View {
        GiveawayView(viewModel: viewModel)
    }
}
#endif
