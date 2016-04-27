//
//  EventsCollection.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/26/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation
import Argo
import Curry

struct EventsCollection {
    var items: [Item]?
}

extension EventsCollection: Decodable {
    static func decode(json: JSON) -> Decoded<EventsCollection> {
        return curry(EventsCollection.init)
            <^> json <||? "items"
    }
}
