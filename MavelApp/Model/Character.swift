//
//  Character.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/26/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation
import Argo
import Curry

class Character {
    var id: Int?
    var name: String?
    var sinopse: String?
    var thumbnail: Thumbnail?
    var comicsCollection: ComicsCollection?
    var seriesCollection: SeriesCollection?
    var eventsCollection: EventsCollection?
    
    init(id: Int?, name: String?, sinopse: String?, thumbnail: Thumbnail?, comics: ComicsCollection?, series: SeriesCollection?, events: EventsCollection?) {
        self.id = id
        self.name = name
        self.sinopse = sinopse
        self.thumbnail = thumbnail
        self.comicsCollection = comics
        self.seriesCollection = series
        self.eventsCollection = events
    }
}

extension Character: Decodable {
    static func decode(json: JSON) -> Decoded<Character> {
        return curry(Character.init)
            <^> json <|? "id"
            <*> json <|? "name"
            <*> json <|? "description"
            <*> json <|? "thumbnail"
            <*> json <|? "comics"
            <*> json <|? "series"
            <*> json <|? "events"
    }
}