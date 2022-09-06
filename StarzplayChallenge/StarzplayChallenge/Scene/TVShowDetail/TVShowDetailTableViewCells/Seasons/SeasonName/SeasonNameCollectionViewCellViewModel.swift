//
//  SeasonNameCollectionViewCellViewModel.swift
//  StarzplayChallenge
//
//  Created by Umair Irfan on 07/09/2022.
//

import Foundation

protocol SeasonNameCollectionViewCellViewModelType {
    func seasonName()-> String
}

class SeasonNameCollectionViewCellViewModel: SeasonNameCollectionViewCellViewModelType {
    
    var name: String?
    
    init(with name: String = "") {
        self.name = name
    }
    
    func seasonName() -> String { self.name ?? "" }
    
}
