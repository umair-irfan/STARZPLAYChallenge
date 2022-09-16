//
//  TVShowDetailViewModel.swift
//  StarzplayChallenge
//
//  Created by Umair Irfan on 05/09/2022.
//

import Foundation

protocol TVShowDetailViewModelType {
    func requestTVShowDetails()
    func requestSeasonDetails(with seasonId: Int)
    func requestEpisodeDetails()
    func getScreenTitle() -> String
    func tableViewNumberOfRowsForStaticSection()-> Int
    func tableViewNumberOfRowsForEpisodeSection()-> Int
    func tableViewNumberOfSections()-> Int
    var  reloadTableViewClosure: (()->())? { get set }
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
    var seasonDetail: SeasonDetail?
    var seasons: [Season]?
    var episodes: [Episode]?
    var episodesCellViewModels: [EpisodesTableViewCellViewModelType]?
    var seasonCellViewModel: SeasonsTableViewCellViewModelType?
    var headerCellViewModel: HeaderImageTableViewCellViewModelType?
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
        return self.headerCellViewModel
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
        return self.seasonCellViewModel
    }
    
    func episodesTableViewCellForRowAt(for indexPath: IndexPath) -> EpisodesTableViewCellViewModelType? {
        return self.episodesCellViewModels?[indexPath.row]
    }
    
    func tableViewNumberOfRowsForStaticSection()-> Int { 4 }
    
    func tableViewNumberOfRowsForEpisodeSection()-> Int { self.episodes?.count ?? 0 }
    
    func tableViewNumberOfSections()-> Int { 3 }
    
    func generateCellViewModels() {
        episodesCellViewModels = self.episodes?.compactMap { EpisodesTableViewCellViewModel(with: $0) }
        seasonCellViewModel = SeasonsTableViewCellViewModel(with: self.seasons ?? [])
        headerCellViewModel = HeaderImageTableViewCellViewModel(with: self.show)
        reloadTableViewClosure?()
    }
}

//MARK: Fetch Data
extension TVShowDetailViewModel {
    
    func requestTVShowDetails() {
        self.repository.fetchTVShowDetails(showId: self.show.id) { repsonse in
            switch repsonse {
            case .success(let details):
                if let seasonId = details?.seasons.first?.seasonNumber {
                    self.requestSeasonDetails(with: seasonId)
                }
                if let seasons = details?.seasons {
                    if seasons.count > 0 {
                        self.seasons = seasons
                    }
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func requestSeasonDetails(with seasonId: Int){
        self.repository.fetchSeasonDetails(tvId: self.show.id, seasonId: seasonId) { resoponse in
            switch resoponse {
            case .success(let seasonDetail):
                self.seasonDetail = seasonDetail
                if let episodes = seasonDetail?.episodes {
                    if episodes.count > 0 {
                        self.episodes = episodes
                        self.generateCellViewModels()
                    }
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func requestEpisodeDetails() {
        
    }
    
}
