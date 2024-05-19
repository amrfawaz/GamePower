//
//  Giveaway.swift
//
//
//  Created by AmrFawaz on 13/05/2024.
//

import Foundation

public struct Giveaway: Codable, Identifiable, Equatable, Hashable {
    public let id: Int
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
    public static var mockedGiveaway: Giveaway {
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

    public static var inactiveGiveaway: Giveaway {
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
            status: "Inactive",
            gamerpowerUrl: "https:\\www.gamerpower.com/mechdefender-indiegala-giveaway",
            openGiveaway: "https://www.gamerpower.com/open/mechdefender-indiegala-giveaway"
        )
    }

    public static var mockedGiveaways: [Giveaway] {
        [
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
            ),
            Giveaway(
                id: 2843,
                title: "Firestone (Epic Games) Special Pack Giveaway",
                worth: "$100.00",
                thumbnail: "https://www.gamerpower.com/offers/1/663ce70a9b15f.jpg",
                image: "https://www.gamerpower.com/offers/1b/663ce70a9b15f.jpg",
                description: "Claim your free Firestone Special Pack via Epic Games Store and unlock 200 Gems, 10 Common chests, 5 Uncommon chests, 10 Wooden chests, 5 Iron Chests, 360 Strange Dust, 50 Scrolls, 2 exclusive Avatars, 35 Game Tokens, 5 Prestige Token and 1 exclusive Skin.",
                instructions: "1. Click the \"Get Giveaway\" button to visit the giveaway page.\r\n2. Login into your Epic Games Store account.\r\n3. Click the button to add the game to your library\r\n4. Log into Firestone through the Epic Games between Thursday 05/09/2024 at 11AM Eastern and Thursday 05/16/2024",
                openGiveawayUrl: "https://www.gamerpower.com/open/firestone-epic-games-special-pack-giveaway",
                publishedDate: "2024-05-09 11:08:58",
                type: "Game",
                platforms: "PC, Epic Games Store",
                endDate: "2024-05-16 23:59:00",
                users: 2250,
                status: "Active",
                gamerpowerUrl: "https://www.gamerpower.com/firestone-epic-games-special-pack-giveaway",
                openGiveaway: "https://www.gamerpower.com/open/firestone-epic-games-special-pack-giveaway"
            ),
            Giveaway(
                id: 2842,
                title: "Circus Electrique (Epic Games) Giveaway",
                worth: "$19.99",
                thumbnail: "https://www.gamerpower.com/offers/1/663ce53c62369.jpg",
                image: "https://www.gamerpower.com/offers/1b/663ce53c62369.jpg",
                description: "Step right into the spotlight of Circus Electrique, now yours for free on the Epic Games Store! This game is like no other 2013 it's a wild mix of storytelling, tactical gameplay, and running your very own circus. Don't miss out on this electrifying adventure!",
                instructions: "1. Click the \"Get Giveaway\" button to visit the giveaway page.\r\n2. Login into your Epic Games Store account.\r\n3. Click the button to add the game to your library",
                openGiveawayUrl: "https://www.gamerpower.com/open/circus-electrique-epic-games-giveaway",
                publishedDate: "2024-05-09 11:01:16",
                type: "Game",
                platforms: "PC, Epic Games Store",
                endDate: "2024-05-16 23:59:00",
                users: 2250,
                status: "Active",
                gamerpowerUrl: "https://www.gamerpower.com/firestone-epic-games-special-pack-giveaway",
                openGiveaway: "https://www.gamerpower.com/open/firestone-epic-games-special-pack-giveaway"
            ),
            Giveaway(
                id: 2841,
                title: "Police Stories: Zombie Case DLC (Steam) Giveaway",
                worth: "$4.99",
                thumbnail: "https://www.gamerpower.com/offers/1/663913179b02d.jpg",
                image: "https://www.gamerpower.com/offers/1b/663913179b02d.jpg",
                description: "Score Police Stories: Zombie Case (DLC) for free via Steam and unlock 5 new missions full of unexpected twists and zombies. Please note the base game Police Stories is required to enjoy this DLC content.",
                instructions: "1. Click the \"Get Giveaway\" button to visit the giveaway page.\r\n2. Login into your Epic Games Store account.\r\n3. Click the button to add the game to your library",
                openGiveawayUrl: "https://www.gamerpower.com/open/circus-electrique-epic-games-giveaway",
                publishedDate: "2024-05-09 11:01:16",
                type: "Game",
                platforms: "PC, Steam",
                endDate: "2024-05-16 23:59:00",
                users: 2250,
                status: "Active",
                gamerpowerUrl: "https://www.gamerpower.com/firestone-epic-games-special-pack-giveaway",
                openGiveaway: "https://www.gamerpower.com/open/firestone-epic-games-special-pack-giveaway"
            ),
            Giveaway(
                id: 2838,
                title: "World of Tanks - Final Frontier Pack (Steam) Giveaway",
                worth: "N/A",
                thumbnail: "https://www.gamerpower.com/offers/1/6633b46844023.jpg",
                image: "https://www.gamerpower.com/offers/1b/6633b46844023.jpg",
                description: "Claim your free World of Tanks Final Frontier Pack DLC on Steam and unlock unique Star Trek-themed decals plus boosters giving an extra impulse to your progress in the game! Please note the base game World of Tanks (Free-to-play) is required to enjoy this content.",
                instructions: "1. Click the \"Get Giveaway\" button to visit the giveaway page.\r\n2. Login into your Epic Games Store account.\r\n3. Click the button to add the game to your library",
                openGiveawayUrl: "https://www.gamerpower.com/open/circus-electrique-epic-games-giveaway",
                publishedDate: "2024-05-09 11:01:16",
                type: "Game",
                platforms: "PC, Steam",
                endDate: "2024-05-16 23:59:00",
                users: 2250,
                status: "Active",
                gamerpowerUrl: "https://www.gamerpower.com/firestone-epic-games-special-pack-giveaway",
                openGiveaway: "https://www.gamerpower.com/open/firestone-epic-games-special-pack-giveaway"
            )
        ]
    }
}
#endif
