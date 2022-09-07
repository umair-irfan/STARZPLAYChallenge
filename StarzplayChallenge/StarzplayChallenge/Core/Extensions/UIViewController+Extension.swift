//
//  UIViewController+Extension.swift
//  StarzplayChallenge
//
//  Created by Umair Irfan on 05/09/2022.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(title: String = "", message: String, defaultButtonTitle: String = "OK", secondayButtonTitle: String? = nil, defaultButtonHandler: ((UIAlertAction) -> Void)? = nil, secondaryButtonHandler: ((UIAlertAction) -> Void)? = nil, completion: (() -> Void)? = nil) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: defaultButtonTitle, style: .default, handler: defaultButtonHandler)
        defaultAction.setValue(UIColor.red, forKey: "titleTextColor")
        alert.addAction(defaultAction)
        
        if secondayButtonTitle != nil {
            let secondaryAction = UIAlertAction(title: secondayButtonTitle, style: .cancel, handler: secondaryButtonHandler)
            secondaryAction.setValue(UIColor.black, forKey: "titleTextColor")
            alert.addAction(secondaryAction)
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.present(alert, animated: true, completion: completion)
        }
    }
    
    public func addBackButton() {
        
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        
        button.setImage(UIImage(named: "icon_back", in: CoreBundel, compatibleWith: nil)?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(onTapBackButton), for: .touchUpInside)
        
        let backButton = UIBarButtonItem()
        backButton.customView = button
        navigationItem.leftBarButtonItem  = backButton
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
    @objc open func onTapBackButton() {
        fatalError("Add back action in viewController")
    }
    
    public func addSearchButton() {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        
        button.setImage(UIImage(named: "icon_search")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(onTapSeachButton), for: .touchUpInside)
        
        let addButton = UIBarButtonItem()
        addButton.customView = button
        navigationItem.rightBarButtonItem  = addButton
        navigationItem.leftBarButtonItem = UIBarButtonItem()
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        
    }
    
    public func addSearchBackButton() {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        
        button.setImage(UIImage(named: "icon_search")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(onTapSeachButton), for: .touchUpInside)
        
        let addButton = UIBarButtonItem()
        addButton.customView = button
        navigationItem.rightBarButtonItem  = addButton
        
        
        let buttonBack = UIButton()
        buttonBack.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        
        buttonBack.setImage(UIImage(named: "icon_back", in: CoreBundel, compatibleWith: nil)?.withRenderingMode(.alwaysTemplate), for: .normal)
        buttonBack.tintColor = .white
        buttonBack.backgroundColor = .clear
        buttonBack.addTarget(self, action: #selector(onTapBackButton), for: .touchUpInside)
        
        let backButton = UIBarButtonItem()
        backButton.customView = buttonBack
        navigationItem.leftBarButtonItem  = backButton
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        
    }
    
    
    @objc open func onTapSeachButton(){
        fatalError("Add action in viewController")
    }
    
    public func addSearchTextField(_ searchBar: UISearchBar){
        let searchField = UIBarButtonItem()
        searchField.customView = searchBar
        searchField.customView?.becomeFirstResponder()
        navigationItem.leftBarButtonItem = searchField
        navigationItem.rightBarButtonItem = UIBarButtonItem()
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
}
