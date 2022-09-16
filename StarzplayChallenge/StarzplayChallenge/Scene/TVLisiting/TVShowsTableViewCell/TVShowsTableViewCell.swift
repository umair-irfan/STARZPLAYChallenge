//
//  TVShowsTableViewCell.swift
//  StarzplayChallenge
//
//  Created by Umair Irfan on 05/09/2022.
//

import UIKit
import UICore

class TVShowsTableViewCell: UITableViewCell, CellViewInitializable {
    
    static var reuseableIdentifier: String = "TVShowsTableViewCell"
    
    @IBOutlet weak var showNameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var overViewLabel: UILabel!
   
    
    //MARK: Properties
    
    private var viewModel: TVShowsTableViewCellViewModelType!

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
    
    func configure(with viewModel:TVShowsTableViewCellViewModelType) {
        self.viewModel = viewModel
        binding()
    }
    
}

private extension TVShowsTableViewCell {
    func binding(){
        showNameLabel.text = viewModel.getShowName()
        overViewLabel.text = viewModel.getOverView()
        ratingLabel.text = viewModel?.getRating()
    }
}
