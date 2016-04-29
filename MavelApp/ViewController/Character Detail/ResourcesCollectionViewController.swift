//
//  ItemsCollectionViewController.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/27/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation
import UIKit

class ResourcesCollectionViewController: UICollectionViewController {
    var resource: ItemsCollectionProtocol?
}

extension ResourcesCollectionViewController {
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let collection = self.resource?.collection {
            return collection.count
        }
        
        return 0
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCollectionCell(metadata: ResourceCollectionViewCell.metadata, forIndexPath: indexPath)
        if let cell = cell as? ResourceCollectionViewCell, collection = self.resource?.collection {
            let item = collection[indexPath.item]
            let viewModel = ResourceViewModel(item: item)
            cell.setupCell(viewModel)
        }
        
        return cell
    }
}