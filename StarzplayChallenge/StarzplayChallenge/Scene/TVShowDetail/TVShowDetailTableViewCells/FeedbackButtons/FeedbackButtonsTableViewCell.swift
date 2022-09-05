//
//  FeedbackButtonsTableViewCell.swift
//  StarzplayChallenge
//
//  Created by Umair Irfan on 06/09/2022.
//

import UIKit

class FeedbackButtonsTableViewCell: UITableViewCell {

    //MARK: Properties
    var viewModel: FeedbackButtonsTableViewCellViewModelType!

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
    
    func configure(with viewModel:FeedbackButtonsTableViewCellViewModelType) {
        self.viewModel = viewModel
        //binding()
    }
    
}
