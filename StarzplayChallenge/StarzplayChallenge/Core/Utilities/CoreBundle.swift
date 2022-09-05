//
//  CoreBundle.swift
//  StarzplayChallenge
//
//  Created by Umair Irfan on 05/09/2022.
//

import Foundation

fileprivate class CoreBundle {
    private init () {}
}

var CoreBundel: Bundle {
    Bundle.init(for: CoreBundle.self)
}
