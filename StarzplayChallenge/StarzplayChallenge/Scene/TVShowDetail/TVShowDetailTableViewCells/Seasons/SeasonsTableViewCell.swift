//
//  SeasonsTableViewCell.swift
//  StarzplayChallenge
//
//  Created by Umair Irfan on 07/09/2022.
//

import UIKit

class SeasonsTableViewCell: UITableViewCell, CellViewInitializable {
    
    @IBOutlet weak var seasonCollectionView: UICollectionView!

    //MARK: Properties
    var viewModel: SeasonsTableViewCellViewModelType!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.seasonCollectionView.register(UINib(nibName: "SeasonNameCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SeasonNameCollectionViewCell")
    }
    
    // MARK: Initialization
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        selectionStyle = .none
        
    }
    
    //MARK: Configure Cellview
    
    func configure(with viewModel:SeasonsTableViewCellViewModelType) {
        self.viewModel = viewModel
        binding()
    }
    
    func binding(){
        seasonCollectionView.reloadData()
    }
}

extension SeasonsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  viewModel.numberOfSeasons()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeasonNameCollectionViewCell", for: indexPath) as! SeasonNameCollectionViewCell
        cell.configure(with: SeasonNameCollectionViewCellViewModel(with: viewModel.seasonName(for: indexPath)))
       return  cell
    }
}
