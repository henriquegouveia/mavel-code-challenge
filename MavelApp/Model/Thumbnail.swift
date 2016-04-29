//
//  Thumbnail.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/25/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation
import Argo
import Curry

struct Thumbnail {
    var path: String?
    var fileType: String?
    var imageURL: NSURL {
        if let path = self.path, fileType = self.fileType {
            if let url = NSURL(string: "\(path).\(fileType)") {
                return url
            }
        }
        
        return NSURL(string: "http://nemanjakovacevic.net/wp-content/uploads/2013/07/placeholder.png")!
    }
}

extension Thumbnail: Decodable {
    static func decode(json: JSON) -> Decoded<Thumbnail> {
        return curry(Thumbnail.init)
            <^> json <|? "path"
            <*> json <|? "extension"
    }
}