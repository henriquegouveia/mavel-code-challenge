//
//  Comic.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/26/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation
import Curry
import Argo

struct Comic {
    var id: String?
    var digitalId: String?
    var title: String?
    var sinopse: String?
}

extension Comic: Decodable {
    static func decode(json: JSON) -> Decoded<Comic> {
        return curry(Comic.init)
            <^> json <|? "id"
            <*> json <|? "digitalId"
            <*> json <|? "title"
            <*> json <|? "description"
    }
}