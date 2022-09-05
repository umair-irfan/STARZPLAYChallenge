//
//  NetworkService.swift
//  StarzplayChallenge
//
//  Created by Umair Irfan on 05/09/2022.
//

import Foundation

class NetworkService {
    
    //MARK: All Services goes here (eg: TV, Movies etc.)
    
    public lazy var television: TVShowServiceType = {
        return TVShowService()
    }()
    
}
