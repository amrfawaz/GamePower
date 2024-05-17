//
//  GiveawaysViewModel.swift
//
//
//  Created by AmrFawaz on 13/05/2024.
//

import Foundation

public final class GiveawaysViewModel: ObservableObject {
    @Published var giveaways: [Giveaway] = []
    @Published var selectedPlatform: String = ""
    
    private let services: GiveawaysService

    var platforms: [String] {
        var platformSet = Set<String>()
        for giveaway in giveaways {
            let platformArray = giveaway.platforms.components(separatedBy: ", ")
            platformSet.formUnion(platformArray)
        }
        return Array(platformSet).sorted()
    }


    func filter() -> [Giveaway] {
        return selectedPlatform == "" 
        ? giveaways
        : giveaways.filter({ $0.platforms.contains(selectedPlatform) })
    }

    func didTapPlatform(platform: String) {
        selectedPlatform = platform
    }

    init(services: GiveawaysService) {
        self.services = services
    }

    @MainActor
    func fetchGiveaways() async -> Void {
        let result = await services.fetchGiveaways()

        switch result {
        case .success(let response):
            giveaways = response
            break
        case .failure(let error):
            // Handle failed response.
            print("Fetch failed: \(error.localizedDescription)")
            break
        }
    }
}
