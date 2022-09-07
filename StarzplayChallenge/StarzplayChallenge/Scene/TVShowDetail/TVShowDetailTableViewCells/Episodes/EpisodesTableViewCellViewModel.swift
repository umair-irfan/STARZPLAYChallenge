//
//  EpisodesTableViewCellViewModel.swift
//  StarzplayChallenge
//
//  Created by Umair Irfan on 07/09/2022.
//

import Foundation

protocol EpisodesTableViewCellViewModelType {
    func episodeName() -> String
}

class EpisodesTableViewCellViewModel: EpisodesTableViewCellViewModelType {
    
    var episode: Episode!
    
    init(with episode: Episode) {
        self.episode = episode
    }
    
    func episodeName() -> String { self.episode.name }
    
}
