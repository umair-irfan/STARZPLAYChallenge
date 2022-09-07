//
//  EpisodeDetail.swift
//  StarzplayChallenge
//
//  Created by Umair Irfan on 07/09/2022.
//

import Foundation

struct Episode {
    let episodeNumber: Int
    let episodeId: Int
    let name: String
    let overview: String?
    let stillPath: String?
    let showId: Int
    let runtime: Int?
}
extension Episode: Codable {
    enum CodingKeys: String, CodingKey {
        case name
        case overview
        case episodeId = "id"
        case episodeNumber = "episode_number"
        case stillPath = "still_path"
        case showId = "show_id"
        case runtime = "runtime"
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        episodeId = try container.decode(Int.self, forKey: .episodeId)
        episodeNumber = try container.decode(Int.self, forKey: .episodeNumber)
        name = try container.decode(String.self, forKey: .name)
        overview = try container.decodeIfPresent(String.self, forKey: .overview) ?? ""
        stillPath = try container.decodeIfPresent(String.self, forKey: .stillPath) ?? ""
        showId = try container.decode(Int.self, forKey: .showId)
        runtime = try container.decodeIfPresent(Int.self, forKey: .runtime) ?? 0
    }
}

struct EpisodeDetail {
    
}

extension EpisodeDetail: Codable {
    
}
