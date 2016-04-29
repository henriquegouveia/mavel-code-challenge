//
//  ItemsViewModel.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/27/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation
import UIKit

class ItemsViewModel {
    private var character: Character?
    private var dataSource: ItemsDataSource?
    
    init(character: Character?) {
        if let character = character, comics = character.comicsCollection, series = character.seriesCollection, events = character.eventsCollection {
            self.character = character
            self.dataSource = ItemsDataSource(collections: [comics,
                series,
                events])
        }
    }
    
    init() {
        self.dataSource = ItemsDataSource(collections: [])
    }
}

extension ItemsViewModel {
    func numberOfSections() -> Int {
        if let dataSource = self.dataSource {
            return dataSource.numberOfSections()
        }
        
        return 0
    }
    
    func numberOfRows(inSection: Int) -> Int {
        if let dataSource = self.dataSource {
            return dataSource.numberOfRows(inSection)
        }
        
        return 0
    }
    
    func cellForRowAtIndexPath(tableView: UITableView, atIndexPath: NSIndexPath) -> UITableViewCell {
        return self.dataSource!.cellForRowAtIndexPath(tableView, atIndexPath: atIndexPath)
    }
}