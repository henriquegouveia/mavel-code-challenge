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
}

extension Thumbnail: Decodable {
    static func decode(json: JSON) -> Decoded<Thumbnail> {
        return curry(Thumbnail.init)
            <^> json <|? "path"
            <*> json <|? "extension"
    }
}