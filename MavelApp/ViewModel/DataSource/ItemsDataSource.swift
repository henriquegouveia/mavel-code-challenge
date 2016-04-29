//
//  ItemsDataSource.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/28/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation
import UIKit

protocol ItemsDataSourceProtocol {
    func titleForHeaderInSection(section: Int) -> String
}

class ItemsDataSource {
    private var collections: [ItemsCollectionProtocol] = []
    

    
    init(collections: [ItemsCollectionProtocol]) {
        for collection in collections {
            if collection.collection?.count > 0 {
                self.collections.append(collection)
            }
        }
    }
}

//MARK: ViewModelDataSourceProtocol Implementation

extension ItemsDataSource: ViewModelDataSourceProtocol {
    func numberOfRows(inSection: Int) -> Int {
        return self.collections.count
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func cellForRowAtIndexPath(tableView: UITableView, atIndexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(metadata: ItemTableViewCell.metadata, forIndexPath: atIndexPath)
        if let cell = cell as? ItemTableViewCell {
            let resource = self.collections[atIndexPath.item]
            cell.setupCell(resource)
        }
        
        return cell
    }
}

//MARK: ItemsDataSourceProtocol Implementation

extension ItemsDataSource: ItemsDataSourceProtocol {
    func titleForHeaderInSection(section: Int) -> String {
        return self.collections[section].collectionName
    }
}