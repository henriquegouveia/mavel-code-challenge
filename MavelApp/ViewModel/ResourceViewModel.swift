//
//  ItemViewModel.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/28/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation

class ResourceViewModel {
    private let item: Item
    private var dataSource: ResourcesDataSource?
    
    var name: String {
        if let name = item.name {
            return name
        }
        
        return ""
    }
    
    init(item: Item) {
        self.item = item
    }
}