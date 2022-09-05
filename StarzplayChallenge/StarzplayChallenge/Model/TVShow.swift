//
//  TVShow.swift
//  StarzplayChallenge
//
//  Created by Umair Irfan on 02/09/2022.
//

import Foundation

struct TV: Codable {
    let page: Int
    let shows: [Show]?
    let totalPages: Int
    let totalResults: Int
}

struct Show: Codable {
    
}
