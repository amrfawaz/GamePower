//
//  GiveawaysViewModel.swift
//
//
//  Created by AmrFawaz on 13/05/2024.
//

import Foundation

final class GiveawaysViewModel: ObservableObject {
    @Published private(set) var giveaways: [Giveaway] = []
    
    private let services = DefaultGiveawaysService()

    public init() {}

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
