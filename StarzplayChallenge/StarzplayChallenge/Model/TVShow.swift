//
//  TVShow.swift
//  StarzplayChallenge
//
//  Created by Umair Irfan on 02/09/2022.
//

import Foundation

struct TV {
    let page: Int
    let shows: [Show]
    let totalPages: Int
    let totalResults: Int
}

extension TV: Codable {
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case shows = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        page = try container.decode(Int.self, forKey: .page)
        shows = try container.decode([Show].self, forKey: .shows)
        totalPages = try container.decode(Int.self, forKey: .totalPages)
        totalResults = try container.decode(Int.self, forKey: .totalResults)
    }
}

struct Show {
    let id: Int
    let name: String
    let originalName: String
    let overview: String
    let popularity: Double
    let voteAverage: Double
    let voteCount: Int
}

extension Show: Codable {
    enum CodingKeys: String, CodingKey {
        case id, name, overview, popularity
        case originalName = "original_name"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        originalName = try container.decode(String.self, forKey: .originalName)
        overview = try container.decode(String.self, forKey: .overview)
        popularity = try container.decode(Double.self, forKey: .popularity)
        voteAverage = try container.decode(Double.self, forKey: .voteAverage)
        voteCount = try container.decode(Int.self, forKey: .voteCount)
    }
}
