//
//  TVShowsTableViewCellViewModel.swift
//  StarzplayChallenge
//
//  Created by Umair Irfan on 05/09/2022.
//

import Foundation

protocol TVShowsTableViewCellViewModelType {
    func getShowName() -> String
    func getOriginalName() -> String
    func getRating()-> String
    func getOverView()-> String
}

class TVShowsTableViewCellViewModel: TVShowsTableViewCellViewModelType {
    
    //MARK: Properties
   
    private let show : Show!
    
    //MARK: Initializer
    
    init(with show: Show) {
        self.show = show
    }
    
    func getShowName() -> String { show.name }
    func getOriginalName() -> String { show.originalName }
    func getRating()-> String { "⭐️ \(show.voteAverage)" }
    func getOverView()-> String { show.overview }
    
}
