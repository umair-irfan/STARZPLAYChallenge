//
//  APIClient.swift
//  StarzplayChallenge
//
//  Created by Umair Irfan on 02/09/2022.
//

import Foundation
import Alamofire

protocol ApiService {
    func request<T:Codable>(router: URLRequestConvertible, onCompletion: @escaping (Result<T,AppError>) -> Void)
}

class ApiClient {
    
    private let session = Session(configuration: URLSessionConfiguration.af.default)
    
    func networkRequset(request : URLRequest?, completion:@escaping (Result<Data,AFError>) -> Void){
        //MARK:- Network Request
        session.request(request!).validate().responseDecodable{ (response: DataResponse<Data, AFError>) in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case.failure(let error):
                completion(.failure(error))
                
            }
        }
    }
}

extension ApiClient: ApiService {
    public func request<T:Codable>(router: URLRequestConvertible, onCompletion: @escaping (Result<T,AppError>) -> Void) {
        
        //MARK:- Check Internet Conectivity
        
        if !Reachability.isConnectedToNetwork() {
            onCompletion(.failure(AppError(error: "Network Error", isNetworkError: true)))
            return
        }
        
        self.networkRequset(request: router.urlRequest()) { result in
            switch result {
            case .success(let data):
                do {
                    let decode = try JSONDecoder().decode(T.self, from: data)
                    onCompletion(.success(decode))
                }catch let error{
                    onCompletion(.failure(AppError(error:error.localizedDescription)))
                }
            case .failure(let error):
                onCompletion(.failure(AppError(error:error.localizedDescription)))
            }
        }
    }
}
