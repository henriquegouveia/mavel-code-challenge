//
//  MarvelAPIClient.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/25/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation

class MarvelAPIClient: MarvelAPIClientType {
    weak var delegate: MarvelAPIClientDelegate?
    
    lazy var manager: HTTPManager = {
        return HTTPManager(extraHeaders: [:])
    }()
    
    func managerForRoute(route: HTTPRouteConvertible) -> HTTPManager {
        return manager
    }
}