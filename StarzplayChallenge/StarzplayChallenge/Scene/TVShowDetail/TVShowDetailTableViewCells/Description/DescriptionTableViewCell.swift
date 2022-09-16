//
//  DescriptionTableViewCell.swift
//  StarzplayChallenge
//
//  Created by Umair Irfan on 06/09/2022.
//

import UIKit
import UICore

class DescriptionTableViewCell: UITableViewCell, CellViewInitializable {
    
    static var reuseableIdentifier: String = "DescriptionTableViewCell"
    
    
    //MARK: View
    @IBOutlet weak var descLabel: UILabel!

    //MARK: Properties
    var viewModel: DescriptionTableViewCellViewModelType!

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
    
    func configure(with viewModel: DescriptionTableViewCellViewModelType) {
        self.viewModel = viewModel
        binding()
    }
}

private extension DescriptionTableViewCell {
    func binding(){
        descLabel.text = viewModel.getShowDescription()
    }
}
