//
//  TVShowService.swift
//  StarzplayChallenge
//
//  Created by Umair Irfan on 02/09/2022.
//

import Foundation

protocol TVShowServiceType {
    func fetchTVShows(completion: @escaping(Result<TV?,AppError>) -> Void)
    func fetchShowDetails(showId: Int, completion: @escaping(Result<ShowDetail?,AppError>) -> Void)
    func fetchSeasonDetails(tvId: Int, seasonId: Int, completion: @escaping(Result<SeasonDetail?,AppError>) -> Void)
    func fetchEpisodeDetails(tvId: Int, seasonId: Int, episodeId: Int, completion: @escaping(Result<EpisodeDetail?,AppError>) -> Void)
}

class TVShowService:ApiClient, TVShowServiceType {
    
    func fetchTVShows(completion: @escaping(Result<TV?,AppError>) -> Void) {
        let router = Router.discoverTVShows(Int.self)
        request(router: router) { (result:Result<TV, AppError>) in
            switch result{
            case .failure(let error):
                //MARK: Network Service Logs here
                
                completion(.failure(error))
            case .success(let data):
                //MARK: Network Service Logs here
                
                completion(.success(data))
            }
        }
    }
    
    func fetchShowDetails(showId: Int, completion: @escaping (Result<ShowDetail?, AppError>) -> Void) {
        let router = Router.getTVShowDetails(showId)
        request(router: router) { (result:Result<ShowDetail, AppError>) in
            switch result{
            case .failure(let error):
                //MARK: Network Service Logs here
                
                completion(.failure(error))
            case .success(let data):
                //MARK: Network Service Logs here
                
                completion(.success(data))
            }
        }
    }
    
    func fetchSeasonDetails(tvId: Int, seasonId: Int, completion: @escaping(Result<SeasonDetail?,AppError>) -> Void) {
        let router = Router.getSeasonDetails(SeasonRequest(tvId: tvId, seasonId: seasonId))
        request(router: router) { (result:Result<SeasonDetail, AppError>) in
            switch result{
            case .failure(let error):
                //MARK: Network Service Logs here
                
                completion(.failure(error))
            case .success(let data):
                //MARK: Network Service Logs here
                
                completion(.success(data))
            }
        }
    }
    
    func fetchEpisodeDetails(tvId: Int, seasonId: Int, episodeId: Int, completion: @escaping(Result<EpisodeDetail?,AppError>) -> Void) {
        
    }
    
}
