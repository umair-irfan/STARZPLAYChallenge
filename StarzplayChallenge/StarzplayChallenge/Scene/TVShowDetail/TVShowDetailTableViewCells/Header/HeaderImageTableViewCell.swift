//
//  HeaderImageTableViewCell.swift
//  StarzplayChallenge
//
//  Created by Umair Irfan on 05/09/2022.
//

import UIKit

class HeaderImageTableViewCell: UITableViewCell, CellViewInitializable {
    
    //MARK: Properties
    
    private var viewModel: HeaderImageTableViewCellViewModelType!

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
    
    func configure(with viewModel:HeaderImageTableViewCellViewModelType) {
        self.viewModel = viewModel
        //binding()
    }
    
}
