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
}

extension CharactersClientType {
    func listCharacters(limit: Int, offset: Int, completion: CharactersClientResult -> Void) -> Request {
        let route = Router.List(limit: limit, offset: offset)
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
    case List(limit: Int, offset: Int)
    
    var route: HTTPRoute {
        switch self {
        case .List(let limit, let offset):
            let parameters = ["limit": limit,
                              "offset": offset]
            let route = HTTPRoute(path: "/characters",
                                  params: MarvelAPIQueryParameters.appendQueryParameters(parameters),
                             method: .GET, encoding: .URL)
            return route
        }
    }
    
    private func path(path: String) -> String {
        return "\(path)apikey=ced6478555e77e191db956de203d45f7&hash=1def7d9f6225ce1683a329c2da36bc59&ts=1461709250"
    }
}
