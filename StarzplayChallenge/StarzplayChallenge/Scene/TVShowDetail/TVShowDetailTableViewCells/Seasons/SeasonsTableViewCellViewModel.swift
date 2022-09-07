//
//  SeasonsTableViewCellViewModel.swift
//  StarzplayChallenge
//
//  Created by Umair Irfan on 07/09/2022.
//

import Foundation

protocol SeasonsTableViewCellViewModelType {
    func seasonName(for indexPath: IndexPath)-> String
    func numberOfSeasons()-> Int
}

class SeasonsTableViewCellViewModel: SeasonsTableViewCellViewModelType {
    
    var seasons: [Season]
    
    init(with seasons: [Season]) {
        self.seasons = seasons
    }
    
    func seasonName(for indexPath: IndexPath) -> String { self.seasons[indexPath.row].seasonName }
    
    func numberOfSeasons() -> Int { self.seasons.count }
    
}
