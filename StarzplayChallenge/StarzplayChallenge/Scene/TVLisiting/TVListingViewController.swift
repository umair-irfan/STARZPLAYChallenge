//
//  TVListingViewController.swift
//  StarzplayChallenge
//
//  Created by Umair Irfan on 05/09/2022.
//

import UIKit
import UICore

class TVListingViewController: UIViewController, StoryboardInitializable {
    
    //MARK: View
    @IBOutlet private var tvShowsTableView: UITableView!
    
    //MARK: Properties
    var viewModel: TVLisitingViewModelType!
    
    
    //MARK: Initializer
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        viewModel.requestTVShows()
        bindViewModel()
    }
    
}

//MARK: View Setup

extension TVListingViewController {
    func setupView(){
        self.title = viewModel.getScreenTitle()
        tvShowsTableView.dataSource = self
        tvShowsTableView.delegate = self
        tvShowsTableView.register(UINib(nibName: "TVShowsTableViewCell", bundle: nil), forCellReuseIdentifier: TVShowsTableViewCell.reuseableIdentifier)
    }
    
    func bindViewModel(){
        self.viewModel.reloadTableViewClosure = { [weak self] in
            DispatchQueue.main.async {
                self?.tvShowsTableView.reloadData()
            }
        }
    }
}

//MARK: Table View Datasource and Delegate

extension TVListingViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tableViewNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellViewModel = viewModel.tableViewCellForRowAt(for: indexPath) else { return UITableViewCell.init() }
        let cell = TVShowsTableViewCell.dequeueReuseableCell(tableView: tableView)
        cell.configure(with: cellViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.tableViewDidSelectRow(for: indexPath)
    }
}

