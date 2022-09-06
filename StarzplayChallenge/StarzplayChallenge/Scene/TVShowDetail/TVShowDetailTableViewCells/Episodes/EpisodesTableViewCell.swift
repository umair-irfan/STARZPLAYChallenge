//
//  EpisodesTableViewCell.swift
//  StarzplayChallenge
//
//  Created by Umair Irfan on 07/09/2022.
//

import UIKit

class EpisodesTableViewCell: UITableViewCell, CellViewInitializable {

    //MARK: Properties
    var viewModel: EpisodesTableViewCellViewModelType!

    override func awakeFromNib() {
        super.awakeFromNib()
        
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
    
    func configure(with viewModel:EpisodesTableViewCellViewModelType) {
        self.viewModel = viewModel
        //binding()
    }
    
}
