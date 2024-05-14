//
//  Giveaway.swift
//
//
//  Created by AmrFawaz on 13/05/2024.
//

import Foundation

struct Giveaway: Codable {
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
    let end_date: String
    let users: Int
    let status: String
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
        case end_date
        case users
        case status
        case gamerpowerUrl = "gamerpower_url"
        case openGiveaway = "open_giveaway"
    }
}
