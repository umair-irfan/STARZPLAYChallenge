//
//  Storyboard+Extension.swift
//  StarzplayChallenge
//
//  Created by Umair Irfan on 05/09/2022.
//

import Foundation
import UIKit

public extension UIStoryboard {
    enum Storyboard: String {
        case main = "Main"
        
        var filename: String {
            return rawValue
        }
    }

    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.filename, bundle: bundle)
    }
}
