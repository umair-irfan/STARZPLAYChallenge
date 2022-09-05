//
//  Router.swift
//  StarzplayChallenge
//
//  Created by Umair Irfan on 02/09/2022.
//

import Foundation


struct DevelopmentServer {
    static var host = "developers.themoviedb.org/3"
}

public protocol URLRequestConvertible {
    func urlRequest()  -> URLRequest?
}

enum Router<T>: URLRequestConvertible {
    
    case getTVShows(T)
    case getSeasons(T)
    case getTVShowDetails(T)
    case getSeasonDetails(T)
    case getEpisodeDetails(T)
    
    
    
    private var scheme: String {
        switch self {
        case .getTVShows, .getSeasons, .getTVShowDetails, .getSeasonDetails, .getEpisodeDetails:
            return "https"
        }
    }
    private var host: String {
        switch self {
        case .getTVShows, .getSeasons, .getTVShowDetails, .getSeasonDetails, .getEpisodeDetails:
            return DevelopmentServer.host
        }
    }
    private var path: String {
        switch self {
        case .getTVShows:
            //MARK:- Fix request endpoint
            return  "/tv/62852?=3d0cda4466f269e793e9283f6ce0b75e"
        case .getSeasons:
            //MARK:- Fix request endpoint
            return  "/tv"
        case .getTVShowDetails:
            //MARK:- Fix request endpoint
            return  "/tv"
        case .getSeasonDetails:
            //MARK:- Fix request endpoint
            return  "/tv"
        case .getEpisodeDetails:
            //MARK:- Fix request endpoint
            return  "/tv"
            
        }
    }
    private var method: String {
        switch self {
        case .getTVShows, .getSeasons, .getTVShowDetails, .getSeasonDetails, .getEpisodeDetails:
            return "GET"
        }
    }
    private var queryParameters: [URLQueryItem]? {
        switch self {
        case .getTVShows(let params):
            let request = params as! TVShowRequest
            return [URLQueryItem(name: "api_key", value: String(request.language)),
                    URLQueryItem(name: "since", value: String(request.since))]
        case .getSeasons(let params):
            let request = params as! SeasonRequest
            return [URLQueryItem(name: "language", value: String(request.language)),
                    URLQueryItem(name: "since", value: String(request.since))]
        case .getTVShowDetails(let params):
            //MARK:- Fix request type
            let request = params as! TVShowRequest
            return [URLQueryItem(name: "language", value: String(request.language)),
                    URLQueryItem(name: "since", value: String(request.since))]
        case .getSeasonDetails(let params):
            //MARK:- Fix request type
            let request = params as! SeasonRequest
            return [URLQueryItem(name: "language", value: String(request.language)),
                    URLQueryItem(name: "since", value: String(request.since))]
        case .getEpisodeDetails(let params):
            //MARK:- Fix request type
            let request = params as! TVShowRequest
            return [URLQueryItem(name: "language", value: String(request.language)),
                    URLQueryItem(name: "since", value: String(request.since))]
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
