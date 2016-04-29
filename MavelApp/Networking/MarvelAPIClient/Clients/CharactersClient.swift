//
//  MarvelAPICharactersClient.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/25/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation

import Foundation
import Alamofire

typealias CharactersClientResult = Result<CharactersCollection, MarvelAPIClientError>

protocol CharactersClientType: MarvelAPIClientType {
    func listCharacters(limit: Int, offset: Int, completion: CharactersClientResult -> Void) -> Request
    func listResources(path: String, completion: CharactersClientResult -> Void) -> Request
}

extension CharactersClientType {
    func listCharacters(limit: Int, offset: Int, completion: CharactersClientResult -> Void) -> Request {
        let route = Router.ListCharacters(limit: limit, offset: offset)
        return sendRequestWithRoute(route, rootKey: "data", completion: completion)
    }
    
    func listResources(path: String, completion: CharactersClientResult -> Void) -> Request {
        let route = Router.ListResources(path)
        return sendRequestWithRoute(route, rootKey: "data", completion: completion)
    }
}

class CharactersClient: CharactersClientType {
    weak var delegate: MarvelAPIClientDelegate?
    
    lazy var manager: HTTPManager = {
        return HTTPManager(extraHeaders: nil)
    }()
    
    func managerForRoute(route: HTTPRouteConvertible) -> HTTPManager {
        return manager
    }
}

private enum Router: HTTPRouteConvertible {
    case ListCharacters(limit: Int, offset: Int)
    case ListResources(String)
    
    var route: HTTPRoute {
        switch self {
        case .ListCharacters(let limit, let offset):
            let parameters = ["limit": limit,
                              "offset": offset]
            let route = HTTPRoute(path: "/v1/public/characters",
                                  params: MarvelAPIQueryParameters.appendQueryParameters(parameters),
                             method: .GET, encoding: .URL)
            return route
            
        case .ListResources(let path):
            let route = HTTPRoute(path: path,
                                  params: MarvelAPIQueryParameters.defaultParameters,
                                  method: .GET,
                                  encoding: .URL)
            return route
        }
    }
}
