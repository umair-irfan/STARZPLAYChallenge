//
//  SeasonNameCollectionViewCell.swift
//  StarzplayChallenge
//
//  Created by Umair Irfan on 07/09/2022.
//

import UIKit

class SeasonNameCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var viewModel: SeasonNameCollectionViewCellViewModelType!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    //MARK: Configure Cellview
    
    func configure(with viewModel: SeasonNameCollectionViewCellViewModelType) {
        self.viewModel = viewModel
        binding()
    }
    
    func binding(){
        nameLabel.text = viewModel.seasonName()
    }

}
