//
//  ItemsDataSource.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/27/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation
import UIKit

class ResourcesDataSource {
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

extension ResourcesDataSource: ViewModelDataSourceProtocol {
    func numberOfRows(inSection: Int) -> Int {
        return (self.collections[inSection].collection?.count)!
    }
    
    func numberOfSections() -> Int {
        return self.collections.count
    }
    
    func cellForRowAtIndexPath(collectionView: UICollectionView, atIndexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCollectionCell(metadata: ResourceCollectionViewCell.metadata, forIndexPath: atIndexPath)
        if let cell = cell as? ResourceCollectionViewCell {
            if let item = self.collections[atIndexPath.section].collection?[atIndexPath.item] {
                let itemViewModel = ResourceViewModel(item: item)
                cell.setupCell(itemViewModel)
            }
        }
        
        return cell
    }
}