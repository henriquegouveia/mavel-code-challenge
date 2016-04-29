//
//  ItemTableViewCell.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/28/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation
import UIKit

class ItemTableViewCell: UITableViewCell {
    
    private var resourcesViewController: ResourcesCollectionViewController?
    
    @IBOutlet weak var collectionNameLabel: UILabel!
    @IBOutlet weak var collectionContainer: UIView!
    
    static var metadata: ReusableViewMetadata = ItemTableViewCellMetadata()
    
    private func instantiateResourcesCollectionView(resource: ItemsCollectionProtocol) {
        self.resourcesViewController = Storyboards.Main.instantiateResourcesCollectionViewController()
        self.resourcesViewController?.resource = resource
    }
    
    func addConstraintToResourceViewController(resourceView: UIView) {
        let views = ["resourceView": resourceView]
        
        let verticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|[resourceView]|",
                                                                                 options: NSLayoutFormatOptions(rawValue: 0),
                                                                                 metrics: nil,
                                                                                 views: views)
        let horizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|[resourceView]|",
                                                                                   options: NSLayoutFormatOptions(rawValue: 0),
                                                                                   metrics: nil,
                                                                                   views: views)
        self.collectionContainer.addConstraints(verticalConstraints)
        self.collectionContainer.addConstraints(horizontalConstraints)
    }
    
    func setupCell(resource: ItemsCollectionProtocol) {
        self.collectionNameLabel.text = resource.collectionName
        self.instantiateResourcesCollectionView(resource)
        self.collectionContainer.addSubview(self.resourcesViewController!.view)
        
        self.addConstraintToResourceViewController(self.resourcesViewController!.view)
        self.collectionContainer.layoutIfNeeded()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        self.resourcesViewController?.view.frame = self.collectionContainer.frame
    }
}

private class ItemTableViewCellMetadata: ReusableViewMetadata {
    private var reuseIdentifier: String {
        return "ItemTableViewCell"
    }
}