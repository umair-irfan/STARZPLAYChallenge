//
//  TVShowDetailViewModel.swift
//  StarzplayChallenge
//
//  Created by Umair Irfan on 05/09/2022.
//

import Foundation

protocol TVShowDetailViewModelType {
    func getScreenTitle() -> String
    func tableViewNumberOfRowsForStaticSection()-> Int
    func tableViewNumberOfRowsForEpisodeSection()-> Int
    func tableViewNumberOfSections()-> Int
//    func tableViewDidSelectRow(for indexPath: IndexPath)
//    func requestTVShows()
//    func generateCellViewModels()
    var reloadTableViewClosure: (()->())? { get set }
    func headerTableViewCellForRowAt(for indexPath: IndexPath) -> HeaderImageTableViewCellViewModelType?
    func buttonsTableViewCellForRowAt(for indexPath: IndexPath) -> PlayButtonsTableViewCellViewModelType?
    func descriptionTableViewCellForRowAt(for indexPath: IndexPath) -> DescriptionTableViewCellViewModelType?
    func feedbackTableViewCellForRowAt(for indexPath: IndexPath) -> FeedbackButtonsTableViewCellViewModelType?
    func seasonsTableViewCellForRowAt(for indexPath: IndexPath) -> SeasonsTableViewCellViewModelType?
    func episodesTableViewCellForRowAt(for indexPath: IndexPath) -> EpisodesTableViewCellViewModelType?
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
    
    func feedbackTableViewCellForRowAt(for indexPath: IndexPath) -> FeedbackButtonsTableViewCellViewModelType? {
        let feedbackViewModel: FeedbackButtonsTableViewCellViewModelType = FeedbackButtonsTableViewCellViewModel()
        return feedbackViewModel
    }
    
    func seasonsTableViewCellForRowAt(for indexPath: IndexPath) -> SeasonsTableViewCellViewModelType? {
        let seasonsViewModel: SeasonsTableViewCellViewModelType = SeasonsTableViewCellViewModel()
        return seasonsViewModel
    }
    
    func episodesTableViewCellForRowAt(for indexPath: IndexPath) -> EpisodesTableViewCellViewModelType? {
        let episodesViewModel: EpisodesTableViewCellViewModelType = EpisodesTableViewCellViewModel()
        return episodesViewModel
    }
    
    func tableViewNumberOfRowsForStaticSection()-> Int { 4 }
    
    func tableViewNumberOfRowsForEpisodeSection()-> Int { 5 }
    
    func tableViewNumberOfSections()-> Int { 2 }
    
    func generateCellViewModels() {
        //cellViewModels = self.tvShows.compactMap { TVShowsTableViewCellViewModel(with: $0) }
        reloadTableViewClosure?()
    }
}
