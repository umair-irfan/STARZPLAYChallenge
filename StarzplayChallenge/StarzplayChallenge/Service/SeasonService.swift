//
//  SeasonService.swift
//  StarzplayChallenge
//
//  Created by Umair Irfan on 02/09/2022.
//

import Foundation

protocol SeasonServiceType {
    func fetchSeasons(for language:String, period:String, completion: @escaping(Result<Season?,AppError>) -> Void)
}

class SeasonService: SeasonServiceType {
    
    private let apiConvertible: ApiService = ApiClient()
    
    func fetchSeasons(for language:String, period:String, completion: @escaping(Result<Season?,AppError>) -> Void) {
        
        let request = SeasonRequest(since: period, language: language)
        let router = Router.getSeasons(request)
        apiConvertible.request(router: router) { (result:Result<Season, AppError>) in
            switch result{
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                completion(.success(data))
                
            }
        }
    }
}
