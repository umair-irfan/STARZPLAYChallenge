//
//  FeedbackButtonsTableViewCell.swift
//  StarzplayChallenge
//
//  Created by Umair Irfan on 06/09/2022.
//

import UIKit

class FeedbackButtonsTableViewCell: UITableViewCell, CellViewInitializable {
    @IBOutlet weak var wishlistButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var dislikeButton: UIButton!

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
        
        wishlistButton.roundedButton()
        likeButton.roundedButton()
        dislikeButton.roundedButton()
       
        //binding()
    }
    
}

extension UIButton {

    func roundedButton(){
    let maskPath = UIBezierPath(roundedRect: self.bounds,
                                byRoundingCorners: [.bottomRight , .topRight, .bottomLeft, .topLeft],
                                cornerRadii:CGSize(width:23, height:23))
    let maskLayer = CAShapeLayer()
    maskLayer.frame = self.bounds
    maskLayer.path = maskPath.cgPath
    self.layer.mask = maskLayer
    }
}
