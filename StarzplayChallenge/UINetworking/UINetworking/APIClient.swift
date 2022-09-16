//
//  APIClient.swift
//  UINetworking
//
//  Created by Umair Irfan on 16/09/2022.
//

import Foundation

protocol ApiService {
    func request<T: Codable>(router: URLRequestConvertable, onCompletion: @escaping (Result<T,AppError>) -> Void)
}

open class ApiClient {
    
    public init() {
        
    }
    
    private let session = URLSession(configuration: .default)
    
    func networkRequset(request : URLRequest?, completion:@escaping (Result<Data,AppError>) -> Void){
        
        //MARK: Validate URL
        
        guard let url = request?.url else {
            let error = AppError(error: ClientErrors.urlValidation)
            completion(.failure(error))
            return
        }
        
        //MARK: Network Request
        
        print(url)
        
        let task = session.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let data = data {
                completion(.success(data))
            } else if let error = error {
                completion(.failure(AppError.init(error: error.localizedDescription)))
            }
        }
        task.resume()
    }
}

extension ApiClient: ApiService {
    public func request<T: Codable>(router: URLRequestConvertable, onCompletion: @escaping (Result<T,AppError>) -> Void) {
        
        //MARK: Check Internet Conectivity
        
        if !Reachability.isConnectedToNetwork() {
            onCompletion(.failure(AppError(error: NetworkErrors.wifi, isNetworkError: true)))
            return
        }
        
        self.networkRequset(request: router.urlRequest()) { (result: Result<Data, AppError>) in
            switch result {
            case .success(let data):
                do {
                    let decode = try JSONDecoder().decode(T.self, from: data)
                    onCompletion(.success(decode))
                }catch {
                    onCompletion(.failure(AppError(error: ClientErrors.serialization)))
                }
            case .failure(let error):
                onCompletion(.failure(AppError(error:error.localizedDescription)))
            }
        }
    }
}
