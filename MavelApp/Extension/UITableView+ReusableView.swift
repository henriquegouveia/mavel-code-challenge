//
//  UITableView+ReusableView.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/27/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func registerTableViewCell(metadata metadata: ReusableViewMetadata) {
        guard let nibName = metadata.nibName else {
            return
        }
        let nib = UINib(nibName: nibName, bundle: nil)
        registerNib(nib, forCellReuseIdentifier: metadata.reuseIdentifier)
    }
    
    func dequeueReusableCell <T: UITableViewCell> (metadata metadata: ReusableViewMetadata,
                              forIndexPath indexPath: NSIndexPath) -> T {
        guard let reusableCell = dequeueReusableCellWithIdentifier(metadata.reuseIdentifier) as? T else {
                                                                    return T(style: .Default, reuseIdentifier: metadata.reuseIdentifier)
        }
        return reusableCell
    }
}

extension UICollectionView {
    func dequeueReusableCollectionCell <T: UICollectionViewCell> (metadata metadata: ReusableViewMetadata,
                                        forIndexPath indexPath: NSIndexPath) -> T {
        guard let reusableCell = dequeueReusableCellWithReuseIdentifier(metadata.reuseIdentifier, forIndexPath: indexPath) as? T else {
            return T()
        }
        return reusableCell
    }
}
