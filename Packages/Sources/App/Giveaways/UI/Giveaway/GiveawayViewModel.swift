//
//  GiveawayViewModel.swift
//
//
//  Created by AmrFawaz on 14/05/2024.
//

import Foundation

final class GiveawayViewModel: ObservableObject {
    enum CardType {
        case carousel
        case list
    }

    @Published var giveaway: Giveaway

    let cardType: CardType

    init(
        giveaway: Giveaway,
        cardType: CardType
    ) {
        self.giveaway = giveaway
        self.cardType = cardType
    }

    var giveawayStatus: Bool {
        giveaway.status == "Active" ? true : false
    }

    func toggelStatus() {
        giveaway.status = giveawayStatus == true ? "Inactive" : "Active"
    }
}

#if DEBUG
extension GiveawayViewModel {
    static var mockListCard: GiveawayViewModel {
        GiveawayViewModel(
            giveaway: .mockedGiveaway,
            cardType: .list
        )
    }

    static var mockCarouselCard: GiveawayViewModel {
        GiveawayViewModel(
            giveaway: .mockedGiveaway,
            cardType: .carousel
        )
    }
}
#endif
