//
//  Router.swift
//  StarzplayChallenge
//
//  Created by Umair Irfan on 02/09/2022.
//

import Foundation

struct Keys: Codable {
    static var movieDb = Bundle.main.object(forInfoDictionaryKey: "api_key") as! String
}

struct DevelopmentServer {
    static var host = "api.themoviedb.org"
}

public protocol URLRequestConverted {
    func urlRequest()  -> URLRequest?
}

enum Router<T>: URLRequestConverted {
    
    case discoverTVShows(T)
    case getTVShowDetails(T)
    case getSeasonDetails(T)
    case getEpisodeDetails(T)
    
    
    
    private var scheme: String {
        switch self {
        case .discoverTVShows, .getTVShowDetails, .getSeasonDetails, .getEpisodeDetails:
            return "https"
        }
    }
    private var host: String {
        switch self {
        case .discoverTVShows, .getTVShowDetails, .getSeasonDetails, .getEpisodeDetails:
            return DevelopmentServer.host
        }
    }
    private var path: String {
        switch self {
        case .discoverTVShows:
            return "/3/discover/tv"
        case .getTVShowDetails(let id):
            return  "/3/tv/\(id)"
        case .getSeasonDetails(let params):
            let request = params as! SeasonRequest
            return  "/3/tv/\(request.tvId)/season/\(request.seasonId)"
        case .getEpisodeDetails(let params):
            let request = params as! EpisodeRequest
            return  "/3/tv/\(request.tvId)/season/\(request.seasonId)/episode/\(request.episodeId)"
            
        }
    }
    private var method: String {
        switch self {
        case .discoverTVShows, .getTVShowDetails, .getSeasonDetails, .getEpisodeDetails:
            return "GET"
        }
    }
    private var queryParameters: [URLQueryItem]? {
        switch self {
        case .discoverTVShows, .getTVShowDetails, .getSeasonDetails, .getEpisodeDetails:
            return [URLQueryItem(name: "api_key", value: String(Keys.movieDb))]
        }
    }
    
    
    
    func urlRequest() -> URLRequest? {
        var components = URLComponents()
        components.queryItems = queryParameters
        components.scheme = self.scheme
        components.host = self.host
        components.path = self.path
        
        guard let url = components.url else {
            assert(true,"url not formed")
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = self.method
        
        return urlRequest
    }
}
