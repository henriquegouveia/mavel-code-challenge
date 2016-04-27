//
//  HTTPRoute.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/24/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation
import Alamofire

struct HTTPRoute {
    let path: String
    let params: [String: AnyObject]?
    let method: Alamofire.Method
    let encoding: ParameterEncoding
}