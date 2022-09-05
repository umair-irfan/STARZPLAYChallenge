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
}

class TVRepository: NetworkService, TVRepositoryType {
    public static var shared = TVRepository()
    func discoverTVShows(onCompletion: @escaping (Result<TV?, AppError>) -> ()) {
        television.fetchTVShows(completion: onCompletion)
    }
    func fetchTVShowDetails(showId: Int, onCompletion: @escaping(Result<ShowDetail?, AppError>)->()){
        television.fetchShowDetails(showId: showId, completion: onCompletion)
    }
}


//MARK:- Data Mocking in Repsitory

class MockTVRepository: TVRepositoryType {
    func discoverTVShows(onCompletion: @escaping (Result<TV?, AppError>) -> ()) {
        
    }
    
    func fetchTVShowDetails(showId: Int, onCompletion: @escaping(Result<ShowDetail?, AppError>)->()){
       
    }
}
