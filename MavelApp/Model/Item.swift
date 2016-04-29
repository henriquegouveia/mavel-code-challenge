//
//  Item.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/26/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation
import Argo
import Curry

struct Item {
    var resourceURI: String?
    var name: String?
    var type: String?
    var thumbnail: Thumbnail?
}

extension Item: Decodable {
    static func decode(json: JSON) -> Decoded<Item> {
        return curry(Item.init)
            <^> json <|? "resourceURI"
            <*> json <|? "name"
            <*> json <|? "type"
            <*> json <|? "thumbnail"
    }
}