//
//  MarvelAPIClientType.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/25/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Alamofire
import Argo

typealias HTTPManager = Alamofire.Manager

protocol MarvelAPIClientType: class {
    func managerForRoute(route: HTTPRouteConvertible) -> HTTPManager
    
    weak var delegate: MarvelAPIClientDelegate? { get set }
}

extension MarvelAPIClientType {
    func sendRequestWithRoute<T: Decodable where T.DecodedType == T>
        (route: HTTPRouteConvertible,
         rootKey: String? = nil,
         completion: (Result<T, MarvelAPIClientError> -> Void)) -> Request
    {
        return request(route).responseObject(rootKey: rootKey) { [weak self] (res: Response<T, NSError>) in
            let result = mapResponse(res)
            self?.verifyResult(result, request: res.request)
            completion(result)
        }
    }
    
    func sendRequestWithRoute<T: Decodable where T.DecodedType == T>
        (route: HTTPRouteConvertible,
         rootKey: String? = nil,
         completion: (Result<[T], MarvelAPIClientError> -> Void)) -> Request
    {
        return request(route).responseArray(rootKey: rootKey) { [weak self] (res: Response<[T], NSError>) in
            let result = mapResponse(res)
            self?.verifyResult(result, request: res.request)
            completion(result)
        }
    }
    
    func sendRequestWithRoute
        (route: HTTPRouteConvertible,
         completion: (MarvelAPIClientError? -> Void)?) -> Request
    {
        return request(route).response { [weak self] (request, response, data, error) in
            if let err = error {
                let clientError = MarvelAPIClientError(response: response, data: data, error: err)
                self?.notifyAboutError(clientError, request: request)
                completion?(clientError)
            } else {
                completion?(nil)
            }
        }
    }
    
    private func request(route: HTTPRouteConvertible) -> Request {
        return managerForRoute(route).request(route).validate()
    }
    
    private func verifyResult<T>(result: Result<T, MarvelAPIClientError>, request: NSURLRequest?) {
        if let error = result.error {
            notifyAboutError(error, request: request)
        }
    }
    
    private func notifyAboutError(error: MarvelAPIClientError, request: NSURLRequest?) {
        delegate?.marvelClient(self, gotError: error, forRequest: request)
    }
}

private func mapResponse<T>(res: Response<T, NSError>) -> Result<T, MarvelAPIClientError> {
    switch res.result {
    case .Success(let value):
        return .Success(value)
    case .Failure(let error):
        return .Failure(MarvelAPIClientError(response: res.response, data: res.data, error: error))
    }
}

