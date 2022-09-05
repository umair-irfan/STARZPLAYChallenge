//
//  AppError.swift
//  StarzplayChallenge
//
//  Created by Umair Irfan on 02/09/2022.
//

import Foundation

public struct AppError: Codable,Error {
    let error : String
    let isNetworkError: Bool
    
    static func generalError() -> AppError{
        return AppError(error: "some thing went wrong")
    }
    
    init(error: String) {
        self.error = error
        self.isNetworkError = false
    }
    
    init(error: String, isNetworkError: Bool) {
        self.error = error
        self.isNetworkError = isNetworkError
    }
    
}

extension AppError {
    private enum CodingKeys: String, CodingKey {
        case error = "Error"
        case isNetworkError = "Network"
    }
}
