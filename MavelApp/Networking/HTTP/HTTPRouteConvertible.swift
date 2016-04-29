//
//  HTTPRouteConvertible.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/25/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation
import Alamofire

protocol HTTPRouteConvertible: URLRequestConvertible, HTTPBaseURL {
    var route: HTTPRoute { get }
}

extension HTTPRouteConvertible {
    var baseURLPath: String {
        #if APP_STORE
            return "https://..."
        #else
            return "http://gateway.marvel.com"
        #endif

    }
}

extension HTTPRouteConvertible {
    var URLRequest: NSMutableURLRequest {
        
        let URL = NSURL(string: baseURLPath)!
        let URLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(route.path))
        URLRequest.HTTPMethod = route.method.rawValue
        
        let result = route.encoding.encode(URLRequest, parameters: route.params).0
        
        return result
    }
}