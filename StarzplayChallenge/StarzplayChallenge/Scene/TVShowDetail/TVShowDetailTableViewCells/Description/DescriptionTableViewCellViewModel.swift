//
//  DescriptionTableViewCellViewModel.swift
//  StarzplayChallenge
//
//  Created by Umair Irfan on 06/09/2022.
//

import Foundation

protocol DescriptionTableViewCellViewModelType {
    func getShowDescription()-> String
}

class DescriptionTableViewCellViewModel: DescriptionTableViewCellViewModelType {
    
    var show: Show!
    
    init(with show: Show){
        self.show = show
    }
    
    func getShowDescription() -> String { self.show.overview } 
}

