//
//  ComicCollection.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/26/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation
import Argo
import Curry

struct ComicsCollection {
    var items: [Item]?
}

extension ComicsCollection: Decodable {
    static func decode(json: JSON) -> Decoded<ComicsCollection> {
        return curry(ComicsCollection.init)
            <^> json <||? "items"
    }
}