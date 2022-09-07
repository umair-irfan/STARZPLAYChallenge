//
//  HeaderImageTableViewCellViewModel.swift
//  StarzplayChallenge
//
//  Created by Umair Irfan on 05/09/2022.
//

import Foundation

protocol HeaderImageTableViewCellViewModelType {
    func showName()-> String
    func rate()-> String
}

class HeaderImageTableViewCellViewModel: HeaderImageTableViewCellViewModelType {
    
    var show: Show!
    
    init(with show: Show){
        self.show = show
    }
    
    func showName() -> String { self.show.name }
    
    func rate() -> String { "Year | 1 Season | R" }
    
}
