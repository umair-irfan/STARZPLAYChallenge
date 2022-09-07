//
//  TVRepository.swift
//  StarzplayChallenge
//
//  Created by Umair Irfan on 05/09/2022.
//

import Foundation

protocol TVRepositoryType {
    func discoverTVShows(onCompletion: @escaping(Result<TV?, AppError>)->())
    func fetchTVShowDetails(showId: Int, onCompletion: @escaping(Result<ShowDetail?, AppError>)->())
    func fetchSeasonDetails(tvId: Int, seasonId: Int, onCompletion: @escaping(Result<SeasonDetail?, AppError>)->())
    func fetchEpisodeDetails(tvId: Int, seasonId: Int, episodeId: Int, onCompletion: @escaping(Result<EpisodeDetail?, AppError>)->())
}

class TVRepository: NetworkService, TVRepositoryType {
    public static var shared = TVRepository()
    func discoverTVShows(onCompletion: @escaping (Result<TV?, AppError>) -> ()) {
        television.fetchTVShows(completion: onCompletion)
    }
    func fetchTVShowDetails(showId: Int, onCompletion: @escaping(Result<ShowDetail?, AppError>)->()){
        television.fetchShowDetails(showId: showId, completion: onCompletion)
    }
    func fetchSeasonDetails(tvId: Int, seasonId: Int, onCompletion: @escaping(Result<SeasonDetail?, AppError>)->()){
        television.fetchSeasonDetails(tvId: tvId, seasonId: seasonId, completion: onCompletion)
    }
    func fetchEpisodeDetails(tvId: Int, seasonId: Int, episodeId: Int,onCompletion: @escaping(Result<EpisodeDetail?, AppError>)->()) {
        television.fetchEpisodeDetails(tvId: tvId, seasonId: seasonId, episodeId: episodeId, completion: onCompletion)
    }
}


//MARK: Data Mock Response

class MockTVRepository: TVRepositoryType {
    func discoverTVShows(onCompletion: @escaping (Result<TV?, AppError>) -> ()) {
        
    }
    
    func fetchTVShowDetails(showId: Int, onCompletion: @escaping(Result<ShowDetail?, AppError>)->()){
       
    }
    
    func fetchSeasonDetails(tvId: Int, seasonId: Int, onCompletion: @escaping(Result<SeasonDetail?, AppError>)->()) {
        
    }
    
    func fetchEpisodeDetails(tvId: Int, seasonId: Int, episodeId: Int,onCompletion: @escaping(Result<EpisodeDetail?, AppError>)->()) {
        
    }
}
