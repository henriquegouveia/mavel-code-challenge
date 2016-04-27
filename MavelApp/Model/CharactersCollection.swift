//
//  CharactersCollection.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/26/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation
import Argo
import Curry

struct CharactersCollection {
    var characters: [Character]?
    var total: Int?
    var count: Int?
}

extension CharactersCollection: Decodable {
    static func decode(json: JSON) -> Decoded<CharactersCollection> {
        print(json)
        return curry(CharactersCollection.init)
            <^> json <||? "results"
            <*> json <|? "total"
            <*> json <|? "count"
    }
}
