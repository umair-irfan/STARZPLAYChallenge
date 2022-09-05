//
//  CellViewInitializable.swift
//  StarzplayChallenge
//
//  Created by Umair Irfan on 05/09/2022.
//

import Foundation
import UIKit

protocol CellViewInitializable {
    static var reuseableIdentifier: String { get }
}

extension CellViewInitializable where Self: UITableViewCell {
    static var reuseableIdentifier: String {
        return String(describing: Self.self)
    }
    
    static func dequeueReuseableCell(tableView: UITableView) -> Self {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseableIdentifier) else {
            return UITableViewCell() as! Self
        }
        return cell as! Self
    }
}
