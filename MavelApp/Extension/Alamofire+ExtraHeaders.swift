//
//  Alamofire+ExtraHeaders.swift
//  ETA
//
//  Created by Henrique Cesar Gouveia on 4/26/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation
import Alamofire

extension Alamofire.Manager {
    
    convenience init(extraHeaders: [String : String]?) {
        let extraHeaders = extraHeaders ?? [:]
        let configuration = NSURLSessionConfiguration.createWithExtraHeaders(extraHeaders)
        self.init(configuration: configuration)
    }
}