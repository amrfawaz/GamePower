//
//  GiveawaysService.swift
//
//
//  Created by AmrFawaz on 13/05/2024.
//

import Foundation
import NetworkManager

protocol GiveawaysService {
    func fetchGiveaways() async -> Result<[Giveaway], Error>
}

public final class DefaultGiveawaysService: GiveawaysService {
    func fetchGiveaways() async -> Result<[Giveaway], Error> {
        let request = FetchGiveawaysRequest(headers: [:])
        let network = NetworkManager()
        do {
            // Call api request.
            let response = try await network.request(request: request, of: [Giveaway].self)
            return .success(response)
        } catch {
            return .failure(error)
        }
    }
}
