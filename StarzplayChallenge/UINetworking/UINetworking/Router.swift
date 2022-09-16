//
//  Router.swift
//  UINetworking
//
//  Created by Umair Irfan on 16/09/2022.
//

import Foundation

public protocol URLRequestConvertable {
    func urlRequest()  -> URLRequest?
}
