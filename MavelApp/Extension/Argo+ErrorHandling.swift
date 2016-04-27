//
//  Argo+ErrorHandling.swift
//  ETA
//
//  Created by Henrique Cesar Gouveia on 4/26/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Argo

public func decode <T: Decodable where T == T.DecodedType> (object: AnyObject, rootKey: String? = nil) throws -> T {
    switch (rootKey == nil ? decode(object) : decodeWithRootKey(rootKey!, object)) as Decoded<T> {
    case .Success(let decodedObject):
        return decodedObject
        
    case .Failure(let decodeError):
        throw decodeError
    }
}

public func decodeArray <T: Decodable where T == T.DecodedType> (object: AnyObject, rootKey: String? = nil) throws -> [T] {
    switch (rootKey == nil ? decode(object) : decodeWithRootKey(rootKey!, object)) as Decoded<[T]> {
    case .Success(let decodedArray):
        return decodedArray
        
    case .Failure(let decodeError):
        throw decodeError
    }
}

// MARK: decode with a root key

public func decodeWithRootKey<T: Decodable where T == T.DecodedType>(rootKey: String, _ object: AnyObject) -> T? {
    return decodeWithRootKey(rootKey, object).value
}

public func decodeWithRootKey<T: Decodable where T == T.DecodedType>(rootKey: String, _ object: AnyObject) -> [T]? {
    return decodeWithRootKey(rootKey, object).value
}

public func decodeWithRootKey<T: Decodable where T == T.DecodedType>(rootKey: String, _ object: AnyObject) -> Decoded<T> {
    return JSON(object) <| rootKey
}

public func decodeWithRootKey<T: Decodable where T == T.DecodedType>(rootKey: String, _ object: AnyObject) -> Decoded<[T]> {
    return JSON(object) <|| rootKey
}