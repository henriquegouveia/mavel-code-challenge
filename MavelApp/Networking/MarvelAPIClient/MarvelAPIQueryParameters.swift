//
//  MarvelAPIAuthorizationAccess.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/27/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation

class MarvelAPIQueryParameters {
    private static let publicKey = "ced6478555e77e191db956de203d45f7"
    private static let privateKey = "f5bd0cba653ada8af1f4c2431e076ec1092f5140"
    private static var queryParameters: [String: AnyObject] {
        let timestamp = Int(NSDate().timeIntervalSince1970)
        return ["apikey": publicKey,
                "hash": createHash(withTimestamp: timestamp),
                "ts": timestamp]
    }
    
    private static func createHash(withTimestamp timestamp: Int) -> String {
        return "\(timestamp)\(privateKey)\(publicKey)".md5()
    }
    
    static func appendQueryParameters(params: [String: AnyObject]) -> [String: AnyObject] {
        var parameters = queryParameters
        for key in params.keys {
            parameters[key] = params[key]
        }
        
        return parameters
    }
}