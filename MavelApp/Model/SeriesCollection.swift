//
//  SeriesCollection.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/26/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation
import Argo
import Curry

struct SeriesCollection {
    var items: [Item]?
}

extension SeriesCollection: Decodable {
    static func decode(json: JSON) -> Decoded<SeriesCollection> {
        return curry(SeriesCollection.init)
            <^> json <||? "items"
    }
}

extension SeriesCollection: ItemsCollectionProtocol {
    var collectionName: String {
        return "SERIES"
    }
    
    var collection: [Item]? {
        return self.items
    }
    
}