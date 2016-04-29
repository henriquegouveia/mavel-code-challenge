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
    func listCharactersWhichNamesStartsWith(name: String, completion: CharactersClientResult -> Void) -> Request
    func listResources(path: String, completion: CharactersClientResult -> Void) -> Request
}

extension CharactersClientType {
    func listCharacters(limit: Int, offset: Int, completion: CharactersClientResult -> Void) -> Request {
        let route = Router.ListAllCharacters(limit: limit, offset: offset)
        return sendRequestWithRoute(route, rootKey: "data", completion: completion)
    }
    
    func listResources(path: String, completion: CharactersClientResult -> Void) -> Request {
        let route = Router.ListResources(path)
        let request = sendRequestWithRoute(route, rootKey: "data", completion: completion)
        return request
    }
    
    func listCharactersWhichNamesStartsWith(name: String, completion: CharactersClientResult -> Void) -> Request {
        let route = Router.ListCharactersWhereNameStartsWith(name: name)
        return sendRequestWithRoute(route, completion: completion)
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
    case ListAllCharacters(limit: Int, offset: Int)
    case ListCharactersWhereNameStartsWith(name: String)
    case ListResources(String)
    
    var route: HTTPRoute {
        switch self {
        case .ListAllCharacters(let limit, let offset):
            let parameters = ["limit": limit,
                              "offset": offset]
            let route = HTTPRoute(path: "/v1/public/characters",
                                  params: MarvelAPIQueryParameters.appendQueryParameters(parameters),
                             method: .GET, encoding: .URL)
            return route
            
        case .ListCharactersWhereNameStartsWith(let name):
            let parameters = ["nameStartsWith": name]
            let route = HTTPRoute(path: "/v1/public/characters",
                                  params: MarvelAPIQueryParameters.appendQueryParameters(parameters),
                                  method: .GET,
                                  encoding: .URL)
            return route
        
        case .ListResources(let path):
            let path = path.stringByReplacingOccurrencesOfString("http://gateway.marvel.com", withString: "")
            let route = HTTPRoute(path: path,
                                  params: MarvelAPIQueryParameters.defaultParameters,
                                  method: .GET,
                                  encoding: .URL)
            return route
        }
    }
}
