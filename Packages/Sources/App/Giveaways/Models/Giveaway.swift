//
//  Giveaway.swift
//
//
//  Created by AmrFawaz on 13/05/2024.
//

import Foundation

struct Giveaway: Codable, Identifiable {
    let id: Int
    let title: String
    let worth: String
    let thumbnail: String
    let image: String
    let description: String
    let instructions: String
    let openGiveawayUrl: String
    let publishedDate: String
    let type: String
    let platforms: String
    let endDate: String
    let users: Int
    var status: String
    let gamerpowerUrl: String
    let openGiveaway: String

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case worth
        case thumbnail
        case image
        case description
        case instructions
        case openGiveawayUrl = "open_giveaway_url"
        case publishedDate = "published_date"
        case type
        case platforms
        case endDate = "end_date"
        case users
        case status
        case gamerpowerUrl = "gamerpower_url"
        case openGiveaway = "open_giveaway"
    }
}

// MARK: - Mocks

#if DEBUG
extension Giveaway {
    static var mockedGiveaway: Giveaway {
        Giveaway(
            id: 2588,
            title: "MechDefender (IndieGala) Giveaway",
            worth: "$0.99",
            thumbnail: "https://www.gamerpower.com/offers/1/6516e1e57062e.jpg",
            image: "https://www.gamerpower.com/offers/1b/6516e1e57062e.jpg",
            description: "Download MechDefender for free via IndieGala! MechDefender is an indie top-down shooter with tower defense features.",
            instructions: "1. Login into your free IndieGala account.\r\n2. Scroll down and click the \"Add to Your Library\" button to add the game to your library.\r\n3. Go to \"My Library\" to find your game.",
            openGiveawayUrl: "https://www.gamerpower.com/open/mechdefender-indiegala-giveaway",
            publishedDate: "2024-05-12 20:31:57",
            type: "Game",
            platforms: "PC, DRM-Free",
            endDate: "N/A",
            users: 3300,
            status: "Active",
            gamerpowerUrl: "https:\\www.gamerpower.com/mechdefender-indiegala-giveaway",
            openGiveaway: "https://www.gamerpower.com/open/mechdefender-indiegala-giveaway"
        )
    }
}
#endif
