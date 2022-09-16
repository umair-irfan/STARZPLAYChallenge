//
//  TVShowDetailViewController.swift
//  StarzplayChallenge
//
//  Created by Umair Irfan on 05/09/2022.
//

import UIKit
import UICore

class TVShowDetailViewController: UIViewController, StoryboardInitializable {
    
    @IBOutlet weak var detailTableView: UITableView!
    
    //MARK: Properties
    var viewModel: TVShowDetailViewModelType!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bindViewModel()
        viewModel.requestTVShowDetails()
    }

}

extension TVShowDetailViewController {
    func setupView(){
        addSearchBackButton()
        self.title = viewModel.getScreenTitle()
        detailTableView.dataSource = self
        detailTableView.delegate = self
        self.registerCells()
    }
    
    func registerCells(){
        detailTableView.register(UINib(nibName: "HeaderImageTableViewCell", bundle: nil), forCellReuseIdentifier: HeaderImageTableViewCell.reuseableIdentifier)
        detailTableView.register(UINib(nibName: "PlayButtonsTableViewCell", bundle: nil), forCellReuseIdentifier: PlayButtonsTableViewCell.reuseableIdentifier)
        detailTableView.register(UINib(nibName: "DescriptionTableViewCell", bundle: nil), forCellReuseIdentifier: DescriptionTableViewCell.reuseableIdentifier)
        detailTableView.register(UINib(nibName: "FeedbackButtonsTableViewCell", bundle: nil), forCellReuseIdentifier: FeedbackButtonsTableViewCell.reuseableIdentifier)
        detailTableView.register(UINib(nibName: "SeasonsTableViewCell", bundle: nil), forCellReuseIdentifier: SeasonsTableViewCell.reuseableIdentifier)
        detailTableView.register(UINib(nibName: "EpisodesTableViewCell", bundle: nil), forCellReuseIdentifier: EpisodesTableViewCell.reuseableIdentifier)
    }
    
    override func onTapBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func onTapSeachButton() {
        
    }
    
    func bindViewModel(){
        self.viewModel.reloadTableViewClosure = { [weak self] in
            DispatchQueue.main.async {
                self?.detailTableView.reloadData()
            }
        }
    }
}

extension TVShowDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.tableViewNumberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return viewModel.tableViewNumberOfRowsForStaticSection()
        }
        if section == 1 {
            return 1
        }else {
            return viewModel.tableViewNumberOfRowsForEpisodeSection()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                guard let cellViewModel = viewModel.headerTableViewCellForRowAt(for: indexPath) else { return UITableViewCell.init() }
                let cell = HeaderImageTableViewCell.dequeueReuseableCell(tableView: tableView)
                cell.configure(with: cellViewModel)
                return cell
            }
            if indexPath.row == 1 {
                guard let cellViewModel = viewModel.buttonsTableViewCellForRowAt(for: indexPath) else { return UITableViewCell.init() }
                let cell = PlayButtonsTableViewCell.dequeueReuseableCell(tableView: tableView)
                cell.configure(with: cellViewModel)
                return cell
            }
            if indexPath.row == 2 {
                guard let cellViewModel = viewModel.descriptionTableViewCellForRowAt(for: indexPath) else { return UITableViewCell.init() }
                let cell = DescriptionTableViewCell.dequeueReuseableCell(tableView: tableView)
                cell.configure(with: cellViewModel)
                return cell
            }else {
                guard let cellViewModel = viewModel.feedbackTableViewCellForRowAt(for: indexPath) else { return UITableViewCell.init() }
                let cell = FeedbackButtonsTableViewCell.dequeueReuseableCell(tableView: tableView)
                cell.configure(with: cellViewModel)
                return cell
            }
        }
        if indexPath.section == 1 {
            guard let cellViewModel = viewModel.seasonsTableViewCellForRowAt(for: indexPath) else { return UITableViewCell.init() }
            let cell = SeasonsTableViewCell.dequeueReuseableCell(tableView: tableView)
            cell.configure(with: cellViewModel)
            return cell
        }else {
            guard let cellViewModel = viewModel.episodesTableViewCellForRowAt(for: indexPath) else { return UITableViewCell.init() }
            let cell = EpisodesTableViewCell.dequeueReuseableCell(tableView: tableView)
            cell.configure(with: cellViewModel)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //viewModel.tableViewDidSelectRow(for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            return 250
        }
        return tableView.estimatedRowHeight
    }
}
