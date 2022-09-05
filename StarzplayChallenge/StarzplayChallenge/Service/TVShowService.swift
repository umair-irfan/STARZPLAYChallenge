//
//  TVShowService.swift
//  StarzplayChallenge
//
//  Created by Umair Irfan on 02/09/2022.
//

import Foundation

protocol TVShowServiceType {
    func fetchTVShows(for language:String, period:String, completion: @escaping(Result<TVShow?,AppError>) -> Void)
}

class TVShowService: TVShowServiceType {
    
    private let apiConvertible: ApiService = ApiClient()
    
    func fetchTVShows(for language:String, period:String, completion: @escaping(Result<TVShow?,AppError>) -> Void) {
        
        let request = TVShowRequest(since: period, language: language)
        let router = Router.getTVShows(request)
        apiConvertible.request(router: router) { (result:Result<TVShow, AppError>) in
            switch result{
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                completion(.success(data))
                
            }
        }
    }
}
