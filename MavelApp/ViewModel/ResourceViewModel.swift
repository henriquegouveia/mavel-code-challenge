//
//  ItemViewModel.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/28/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation

class ResourceViewModel {
    private var item: Item
    private var dataSource: ResourcesDataSource?
    private let client = CharactersClient()
    
    var name: String {
        if let name = item.name {
            return name
        }
        
        return ""
    }
    
    init(item: Item) {
        self.item = item
    }
    
    //MARK: Private Methods
    
    private func getImageRemotely(completion: (NSURL) -> Void) {
        if let resourceURI = item.resourceURI {
            self.client.listResources(resourceURI, completion: { character in
                switch character {
                case .Success(let result):
                    if let thumb = result.characters?[0].thumbnail {
                        self.item.thumbnail = thumb
                        completion(thumb.imageURL)
                    }
                    break
                case .Failure(_):
                    self.item.thumbnail = nil
                }
            })
        }
    }
    
    //MARK: Public Methods
    
    func getImageURLForItem(completion: (NSURL) -> Void) {
        if let thumbnail = item.thumbnail {
            completion(thumbnail.imageURL)
        } else {
            self.getImageRemotely(completion)
        }
    }
}