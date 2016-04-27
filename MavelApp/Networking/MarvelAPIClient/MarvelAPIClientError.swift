//
//  MarvelClientError.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/25/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation
import Alamofire

enum MarvelAPIClientError: CustomErrorConvertible {
    case Unknown(NSHTTPURLResponse?, NSData?, NSError)
    case SerializationError(NSError)
    case ServerError(MarvelAPIServerError)
    
    init(response: NSHTTPURLResponse?, data: NSData?, error: NSError) {
        if let serverError = MarvelAPIServerError.serverErrorForResponse(response, data: data) {
            self = .ServerError(serverError)
        } else if let alamofireCode = Alamofire.Error.Code(rawValue: error.code)
            where alamofireCode == .JSONSerializationFailed {
            self = .SerializationError(error)
        } else {
            self = .Unknown(response, data, error)
        }
    }
    
    var code: Int {
        switch self {
        case .Unknown: return 0
        case .SerializationError: return 1
        case .ServerError: return 2
        }
    }
    
    var domain: String {
        return "com.henrique.gouveia.MarvelAPIClientError"
    }
    
    var childError: CustomErrorConvertible? {
        switch self {
        case .Unknown(_, _, let err): return err
        case .SerializationError(let err): return err
        case .ServerError(let err): return err
        }
    }
}
