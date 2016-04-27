//
//  CharacterViewModel.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/27/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation

class CharacterViewModel {
    var character: Character
    
    var characterImageURL: NSURL {
        if let path = self.character.thumbnail?.path, fileType = self.character.thumbnail?.fileType {
            if let url = NSURL(string: "\(path).\(fileType)") {
                return url
            }
        }
        
        return NSURL(string: "http://nemanjakovacevic.net/wp-content/uploads/2013/07/placeholder.png")!
    }
    
    init(character: Character) {
        self.character = character
    }
}
