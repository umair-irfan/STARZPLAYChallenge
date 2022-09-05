//
//  APIClient.swift
//  StarzplayChallenge
//
//  Created by Umair Irfan on 02/09/2022.
//

import Foundation
import Alamofire

protocol ApiService {
    func request<T:Codable>(router: URLRequestConverted, onCompletion: @escaping (Result<T,AppError>) -> Void)
}

class ApiClient {
    
    func networkRequset(request : URLRequest?, completion:@escaping (Result<Data,AppError>) -> Void){
      
        //MARK:- Validate URL
        
        guard let _ = request?.url else {
            let error = AppError(error: "Not a valid Url")
            completion(.failure(error))
            return
        }
        
        //MARK:- Network Request
        
        AF.request(request!).validate().responseDecodable{ (response: DataResponse<Data, AFError>) in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case.failure(let error):
                let err = AppError(error: error.localizedDescription)
                completion(.failure(err))
            }
        }
    }
}

extension ApiClient: ApiService {
    public func request<T:Codable>(router: URLRequestConverted, onCompletion: @escaping (Result<T,AppError>) -> Void) {
        
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
