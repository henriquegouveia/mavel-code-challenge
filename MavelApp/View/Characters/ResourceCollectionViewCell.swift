//
//  ItemCollectionViewCell.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/27/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation
import UIKit

class ResourceCollectionViewCell: UICollectionViewCell {
    
    static let metadata: ReusableViewMetadata = ResourceCollectionViewCellMetada()
    
    private var viewModel: ResourceViewModel?
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    func setupCell(viewModel: ResourceViewModel) {
        self.viewModel = viewModel
        self.itemNameLabel.text = self.viewModel!.name
        self.itemImageView.image = nil
        self.viewModel?.getImageURLForItem({ url in
            self.itemImageView.nk_setImageWith(url)
        })
    }
}

private class ResourceCollectionViewCellMetada: ReusableViewMetadata {
    var reuseIdentifier: String {
        return "ResourceCollectionViewCell"
    }
}