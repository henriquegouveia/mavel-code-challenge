//
//  MarvelAPIError.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/25/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Alamofire
import Argo
import Curry

enum MarvelAPIServerErrorCode: Int, CustomStringConvertible {
    case InvalidRefererOrHash = 401
    case Forbidden = 403
    case MethodNotAllowed = 405
    case MissingParams = 409
    
    var description: String {
        switch self {
        case .InvalidRefererOrHash: return "\(rawValue) (InvalidRefererOrHash)"
        case .Forbidden: return "\(rawValue) (Forbidden)"
        case .MethodNotAllowed: return "\(rawValue) (MethodNotAllowed)"
        case .MissingParams: return "\(rawValue) (MissingParams)"
        }
    }
}

struct MarvelAPIServerError: CustomErrorConvertible {
    static let jsonSchema = ServerErrorJSONSchema()
    
    let statusCode: MarvelAPIServerErrorCode
    let data: [NSObject : AnyObject]?
    
    var domain: String {
        return "com.henrique.gouveia.MarvelAPIServerError"
    }
    
    var code: Int {
        return statusCode.rawValue
    }
    
    var userInfo: [NSObject : AnyObject] {
        return [
            "statusCode" : statusCode.description,
            "data" : data ?? NSNull()
        ]
    }
    
    static func serverErrorForResponse(response: NSHTTPURLResponse?, data: NSData?) -> MarvelAPIServerError? {
        guard let response = response else { return nil }
        guard let code = MarvelAPIServerErrorCode(rawValue: response.statusCode) else { return nil }
        
        let JSONResponseSerializer = Request.JSONResponseSerializer(options: .AllowFragments)
        let result = JSONResponseSerializer.serializeResponse(nil, response, data, nil)
        
        switch result {
        case .Success(let value):
            return MarvelAPIServerError(statusCode: code, data: value as? [NSObject : AnyObject])
        case .Failure:
            return MarvelAPIServerError(statusCode: code, data: nil)
        }
    }
}

struct ServerErrorJSONSchema {
    let codeKey = "code"
    let message = "status"
}
