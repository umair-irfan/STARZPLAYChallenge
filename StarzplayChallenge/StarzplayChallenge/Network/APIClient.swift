//
//  APIClient.swift
//  StarzplayChallenge
//
//  Created by Umair Irfan on 02/09/2022.
//

import Foundation
import Alamofire

protocol ApiService {
    func request<T: Codable>(router: URLRequestConverted, onCompletion: @escaping (Result<T,AppError>) -> Void)
}

class ApiClient {
    
    func networkRequset(request : URLRequest?, completion:@escaping (Result<Data,AppError>) -> Void){
      
        //MARK: Validate URL
        
        guard let url = request?.url else {
            let error = AppError(error: "Not a valid Url")
            completion(.failure(error))
            return
        }
        
        //MARK: Network Request
        
        print(url)
        
        AF.request(request!).validate(statusCode: 200...299)
            .responseData(completionHandler: { (response: AFDataResponse<Data>) in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case.failure(let error):
                let err = AppError(error: error.localizedDescription)
                completion(.failure(err))
            }
        })
    }
}

extension ApiClient: ApiService {
    public func request<T: Codable>(router: URLRequestConverted, onCompletion: @escaping (Result<T,AppError>) -> Void) {
        
        //MARK: Check Internet Conectivity
        
        if !Reachability.isConnectedToNetwork() {
            onCompletion(.failure(AppError(error: "Network Error", isNetworkError: true)))
            return
        }
        
        self.networkRequset(request: router.urlRequest()) { (result: Result<Data, AppError>) in
            switch result {
            case .success(let data):
                do {
                    let decode = try JSONDecoder().decode(T.self, from: data)
                    onCompletion(.success(decode))
                }catch {
                    onCompletion(.failure(AppError(error: "Data Serailization Error")))
                }
            case .failure(let error):
                onCompletion(.failure(AppError(error:error.localizedDescription)))
            }
        }
    }
}
