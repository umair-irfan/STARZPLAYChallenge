//
//  SeasonDetail.swift
//  StarzplayChallenge
//
//  Created by Umair Irfan on 07/09/2022.
//

import Foundation

struct Season {
    let seasonId: Int
    let seasonName: String
    let episodeCount: Int
    let seasonNumber: Int
    let overview: String?
    let posterPath: String
}
extension Season: Codable {
    enum CodingKeys: String, CodingKey {
        case seasonId = "id"
        case seasonName = "name"
        case episodeCount = "episode_count"
        case seasonNumber = "season_number"
        case overview = "overview"
        case posterPath = "poster_path"
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        seasonId = try container.decode(Int.self, forKey: .seasonId)
        seasonName = try container.decode(String.self, forKey: .seasonName)
        episodeCount = try container.decode(Int.self, forKey: .episodeCount)
        seasonNumber = try container.decode(Int.self, forKey: .seasonNumber)
        overview = try container.decode(String.self, forKey: .overview)
        posterPath = try container.decode(String.self, forKey: .posterPath)
    }
}


struct SeasonDetail {
    let seasonId: Int
    let overview: String?
    let name: String
    let id: String
    let posterPath: String
    let seasonNumber: Int
    let episodes: [Episode]
}
extension SeasonDetail: Codable {
    enum CodingKeys: String, CodingKey {
        case overview, name
        case id = "_id"
        case seasonId = "id"
        case posterPath = "poster_path"
        case seasonNumber = "season_number"
        case episodes = "episodes"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        seasonId = try container.decode(Int.self, forKey: .seasonId)
        overview = try container.decodeIfPresent(String.self, forKey: .overview) ?? ""
        name = try container.decode(String.self, forKey: .name)
        id = try container.decode(String.self, forKey: .id)
        posterPath = try container.decode(String.self, forKey: .posterPath)
        seasonNumber = try container.decode(Int.self, forKey: .seasonNumber)
        episodes = try container.decode([Episode].self, forKey: .episodes)
    }
}
