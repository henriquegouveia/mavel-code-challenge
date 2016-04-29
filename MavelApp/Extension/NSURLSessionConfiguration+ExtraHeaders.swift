//
//  NSURLSessionConfiguration+ExtraHeaders.swift
//  ETA
//
//  Created by Henrique Cesar Gouveia on 4/26/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Alamofire

extension NSURLSessionConfiguration {
    
    static func createWithExtraHeaders(extraHeaders: [String : String] = [:]) -> NSURLSessionConfiguration {
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        var headers = Manager.defaultHTTPHeaders
        headers["Accept-Encoding"] = "gzip"
        headers["Content-Type"] = "application/json"
        
        for (key, value) in extraHeaders {
            headers[key] = value
        }
        
        configuration.HTTPAdditionalHeaders = headers
        return configuration
    }
}