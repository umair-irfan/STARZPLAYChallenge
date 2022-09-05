//
//  TVShowService.swift
//  StarzplayChallenge
//
//  Created by Umair Irfan on 02/09/2022.
//

import Foundation

protocol TVShowServiceType {
    func fetchTVShows(completion: @escaping(Result<TV?,AppError>) -> Void)
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
}
