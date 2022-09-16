//
//  TVLisitingViewModel.swift
//  StarzplayChallenge
//
//  Created by Umair Irfan on 05/09/2022.
//

import Foundation


protocol TVLisitingViewModelType {
    func getScreenTitle() -> String
    func tableViewCellForRowAt(for indexPath: IndexPath) -> TVShowsTableViewCellViewModelType?
    func tableViewNumberOfRows()-> Int
    func tableViewDidSelectRow(for indexPath: IndexPath)
    func requestTVShows()
    func generateCellViewModels()
    var reloadTableViewClosure: (()->())? { get set }
    var navigateToDetailClosure: ((Show)->())? { get set }
    var cellViewModels : [TVShowsTableViewCellViewModelType]? { get }
}

class TVLisitingViewModel: TVLisitingViewModelType {
    
    //MARK: Properties
    private var tvShows = [Show]()
    private var repository: TVRepositoryType = TVRepository()
    private(set) lazy var cellViewModels : [TVShowsTableViewCellViewModelType]? = [TVShowsTableViewCellViewModelType]()
    var reloadTableViewClosure: (()->())?
    var navigateToDetailClosure: ((Show)->())?
    
    //MARK: Initialiser
    
    init(with repo: TVRepositoryType) {
        self.repository = repo
    }
    
    func getScreenTitle() -> String { return "TV Shows" }
    
}

//MARK: TableView Data Binding
extension TVLisitingViewModel {
    
    func tableViewCellForRowAt(for indexPath: IndexPath) -> TVShowsTableViewCellViewModelType? {
        return cellViewModels?[indexPath.row]
    }
    
    func tableViewNumberOfRows()-> Int {  cellViewModels?.count ??  0 }
    
    func generateCellViewModels() {
        cellViewModels = self.tvShows.compactMap { TVShowsTableViewCellViewModel(with: $0) }
        reloadTableViewClosure?()
    }
    
    func tableViewDidSelectRow(for indexPath: IndexPath) {
        self.navigateToDetailClosure?(self.tvShows[indexPath.row])
    }
}

//MARK: Fetch Data
extension TVLisitingViewModel {
    func requestTVShows() {
        self.repository.discoverTVShows { result in
            switch result {
            case .success(let tvData):
                if let shows = tvData?.shows {
                    self.tvShows = shows
                    self.generateCellViewModels()
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
