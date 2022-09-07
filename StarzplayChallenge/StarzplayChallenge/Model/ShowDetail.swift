//
//  ShowDetail.swift
//  StarzplayChallenge
//
//  Created by Umair Irfan on 05/09/2022.
//

import Foundation

struct ShowDetail {
    let tvId: Int
    let name: String
    let originalName: String
    let numberOfSeasons: Int
    let numberOfEpisodes: Int
    let originalLanguage: String
    let overview: String?
    let seasons: [Season]
}

extension ShowDetail: Codable {
    enum CodingKeys: String, CodingKey {
        case name, overview
        case tvId = "id"
        case originalName = "original_name"
        case numberOfSeasons = "number_of_seasons"
        case numberOfEpisodes = "number_of_episodes"
        case originalLanguage = "original_language"
        case seasons = "seasons"
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        tvId = try container.decode(Int.self, forKey: .tvId)
        name = try container.decode(String.self, forKey: .name)
        originalName = try container.decode(String.self, forKey: .originalName)
        numberOfSeasons = try container.decode(Int.self, forKey: .numberOfSeasons)
        numberOfEpisodes = try container.decode(Int.self, forKey: .numberOfEpisodes)
        originalLanguage = try container.decode(String.self, forKey: .originalLanguage)
        overview = try container.decodeIfPresent(String.self, forKey: .overview) ?? ""
        seasons = try container.decode([Season].self, forKey: .seasons)
    }
}
