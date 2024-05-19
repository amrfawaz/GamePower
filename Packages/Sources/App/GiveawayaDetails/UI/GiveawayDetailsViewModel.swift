//
//  GiveawayDetailsViewModel.swift
//
//
//  Created by AmrFawaz on 17/05/2024.
//

import SwiftUI
import CoreInterface

public final class GiveawayDetailsViewModel: ObservableObject {
    @Published private(set) var giveaway: Giveaway

    public init(giveaway: Giveaway) {
        self.giveaway = giveaway
    }

    var giveawayStatus: Bool {
        giveaway.status == "Active" ? true : false
    }

    func toggelStatus() {
        giveaway.status = giveawayStatus == true ? "Inactive" : "Active"
    }
}
