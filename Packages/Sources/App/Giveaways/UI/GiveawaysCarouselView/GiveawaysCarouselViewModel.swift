//
//  GiveawaysCarouselViewModel.swift
//
//
//  Created by AmrFawaz on 17/05/2024.
//

import Foundation

final class GiveawaysCarouselViewModel: ObservableObject {
    private(set) var giveaways: [Giveaway]

    init(giveaways: [Giveaway]) {
        self.giveaways = giveaways
    }
}

// MARK: - Mocks

#if DEBUG
extension GiveawaysCarouselViewModel {
    static var mockedGiveaways: [Giveaway] {
        Giveaway.mockedGiveaways
    }
}
#endif
