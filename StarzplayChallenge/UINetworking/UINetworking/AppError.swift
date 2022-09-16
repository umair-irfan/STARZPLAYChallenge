//
//  AppError.swift
//  
//
//  Created by Umair Irfan on 16/09/2022.
//

import Foundation


struct NetworkErrors {
    static var general = "Something went wrong"
    static var wifi = "Wifi error"
}

struct ClientErrors {
    static var serialization = "Unable to serialize the Response"
    static var urlValidation = "Invalid Request URL"
}

public struct AppError: Codable,Error {
    let description : String
    let isNetworkError: Bool
    
    init(error: String) {
        self.description = error
        self.isNetworkError = false
    }
    
    init(error: String, isNetworkError: Bool) {
        self.description = error
        self.isNetworkError = isNetworkError
    }
    
}

extension AppError {
    private enum CodingKeys: String, CodingKey {
        case description = "Error"
        case isNetworkError = "Network"
    }
}
