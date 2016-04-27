//
//  AlamofireRequest+Argo.swift
//  ETA
//
//  Created by Henrique Cesar Gouveia on 4/26/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation
import Alamofire
import Argo

extension Request {
    func responseObject<T: Decodable where T.DecodedType == T>
        (rootKey rootKey: String? = nil, completionHandler: Response<T, NSError> -> Void) -> Self
    {
        let responseSerializer = ResponseSerializer<T, NSError> { request, response, data, error in
            guard error == nil else { return .Failure(error!) }
            
            let JSONResponseSerializer = Request.JSONResponseSerializer(options: .AllowFragments)
            let result = JSONResponseSerializer.serializeResponse(request, response, data, error)
            
            switch result {
            case .Success(let value):
                switch (rootKey == nil ? decode(value) : decodeWithRootKey(rootKey!, value)) as Decoded<T> {
                case .Success(let responseObject):
                    return .Success(responseObject)
                case .Failure(let decodeError):
                    let error = Error.errorWithCode(.JSONSerializationFailed, failureReason: decodeError.description)
                    return .Failure(error)
                }
            case .Failure(let error):
                return .Failure(error)
            }
        }
        
        return response(responseSerializer: responseSerializer, completionHandler: completionHandler)
    }
    
    func responseArray<T: Decodable where T.DecodedType == T>
        (rootKey rootKey: String? = nil, completionHandler: Response<[T], NSError> -> Void) -> Self
    {
        let responseSerializer = ResponseSerializer<[T], NSError> { request, response, data, error in
            guard error == nil else { return .Failure(error!) }
            
            let JSONResponseSerializer = Request.JSONResponseSerializer(options: .AllowFragments)
            let result = JSONResponseSerializer.serializeResponse(request, response, data, error)
            
            switch result {
            case .Success(let value):
                switch (rootKey == nil ? decode(value) : decodeWithRootKey(rootKey!, value)) as Decoded<[T]> {
                case .Success(let responseArray):
                    return .Success(responseArray)
                case .Failure(let decodeError):
                    let error = Error.errorWithCode(.JSONSerializationFailed, failureReason: decodeError.description)
                    return .Failure(error)
                }
            case .Failure(let error):
                return .Failure(error)
            }
        }
        
        return response(responseSerializer: responseSerializer, completionHandler: completionHandler)
    }
}
