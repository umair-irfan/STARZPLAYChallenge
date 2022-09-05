//
//  TVShowDetailViewModel.swift
//  StarzplayChallenge
//
//  Created by Umair Irfan on 05/09/2022.
//

import Foundation

protocol TVShowDetailViewModelType {
    func getScreenTitle() -> String
    func tableViewNumberOfRows()-> Int
//    func tableViewDidSelectRow(for indexPath: IndexPath)
//    func requestTVShows()
//    func generateCellViewModels()
    var reloadTableViewClosure: (()->())? { get set }
    func headerTableViewCellForRowAt(for indexPath: IndexPath) -> HeaderImageTableViewCellViewModelType?
    func buttonsTableViewCellForRowAt(for indexPath: IndexPath) -> PlayButtonsTableViewCellViewModelType?
    func descriptionTableViewCellForRowAt(for indexPath: IndexPath) -> DescriptionTableViewCellViewModelType?
}

class TVShowDetailViewModel: TVShowDetailViewModelType {
    
    var repository: TVRepositoryType!
    var show: Show!
    var reloadTableViewClosure: (()->())?
    
    init(with repo: TVRepositoryType, show: Show) {
        self.repository = repo
        self.show = show
    }
    
    func getScreenTitle() -> String { return "TV Show Details" }
}

//MARK: TableView Data Binding
extension TVShowDetailViewModel {
    
    func headerTableViewCellForRowAt(for indexPath: IndexPath) -> HeaderImageTableViewCellViewModelType? {
        let headerViewModel: HeaderImageTableViewCellViewModelType = HeaderImageTableViewCellViewModel()
        return headerViewModel
    }
    
    func buttonsTableViewCellForRowAt(for indexPath: IndexPath) -> PlayButtonsTableViewCellViewModelType? {
        let playButtonsViewModel: PlayButtonsTableViewCellViewModelType = PlayButtonsTableViewCellViewModel()
        return playButtonsViewModel
    }
    
    func descriptionTableViewCellForRowAt(for indexPath: IndexPath) -> DescriptionTableViewCellViewModelType? {
        let descViewModel: DescriptionTableViewCellViewModelType = DescriptionTableViewCellViewModel(with: self.show)
        return descViewModel
    }
    
    func tableViewNumberOfRows()-> Int { 3 }
    
    func generateCellViewModels() {
        //cellViewModels = self.tvShows.compactMap { TVShowsTableViewCellViewModel(with: $0) }
        reloadTableViewClosure?()
    }
}
