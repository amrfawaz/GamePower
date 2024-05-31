//
//  GiveawayViewTCA.swift
//
//
//  Created by AmrFawaz on 29/05/2024.
//

import SwiftUI
import CoreInterface
import ComposableArchitecture

enum CardType: Equatable {
    case carousel
    case list
}

@Reducer
struct GiveawayViewTCAReducer {
    enum Action {
        case toggelFavorite(Bool)
    }

    @ObservableState
    struct State: Equatable {
        var giveaway: Giveaway
        let cardType: CardType
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .toggelFavorite(let isActive):
                state.giveaway.status = isActive == true ? "Inactive" : "Active"
            }
            return .none
        }
    }
}

struct GiveawayViewTCA: View {
    let store: StoreOf<GiveawayViewTCAReducer>
 
    var body: some View {
        
        ZStack {
            backgroundImage
            overlayView
            content
                .padding(.all, Style.Spacing.md)
        }
        .frame(height: store.state.cardType == .list ? Style.Size.listCardHeight : Style.Size.carouselCardHeight)
        .clipShape(.rect(cornerRadius: Style.Spacing.md))
        .padding(.horizontal, Style.Spacing.md)
        .padding(.top, Style.Spacing.sm)

    }

    var backgroundImage: some View {
        AsyncImage(
            url: URL(
                string: store.state.giveaway.image
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

private extension GiveawayViewTCA {
    var header: some View {
        HStack(alignment: .top, spacing: Style.Spacing.xs) {
            title
                .foregroundStyle(.white)

            Spacer()

            if store.state.cardType == .list {
                heartButton
                    .frame(minHeight: Style.Size.heartButtonHeight, maxHeight: Style.Size.heartButtonWidth)
            }
        }
    }

    var title: some View {
        Text(store.state.giveaway.title)
            .typography(.heading02)
            .foregroundStyle(.white)
    }

    var heartButton: some View {
        Button(action: {
            store.send(.toggelFavorite(store.giveaway.status == "Active" ))
        }) {
            Image(systemName: store.state.giveaway.status == "Active" ? "heart.fill" : "heart")
                .foregroundColor(.white)
                .font(.system(size: 30))
        }
    }

    var description: some View {
        VStack(
            alignment: .leading,
            spacing: .zero
        ) {
            if store.state.cardType == .list {
                Text(store.state.giveaway.platforms)
                    .typography(.caption01)
                    .foregroundStyle(.white)
                    .padding(.top, Style.Spacing.sm)
            }

            Spacer()

            Text(store.state.giveaway.description)
                .typography(.body01)
                .foregroundStyle(.white)

        }
    }

}

#Preview {
    GiveawayViewTCA(store: Store(initialState: GiveawayViewTCAReducer.State(giveaway: .mockedGiveaway, cardType: .list), reducer: {
        GiveawayViewTCAReducer()
    }))
}
