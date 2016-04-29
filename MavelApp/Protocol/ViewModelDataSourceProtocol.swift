//
//  ViewModelDataSourceProtocol.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/27/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation
import UIKit

protocol ViewModelDataSourceProtocol {
    func numberOfRows(inSection: Int) -> Int
    func numberOfSections() -> Int
    func cellForRowAtIndexPath(tableView: UITableView, atIndexPath: NSIndexPath) -> UITableViewCell
    func cellForRowAtIndexPath(collectionView: UICollectionView, atIndexPath: NSIndexPath) -> UICollectionViewCell
}

extension ViewModelDataSourceProtocol {
    func cellForRowAtIndexPath(tableView: UITableView, atIndexPath: NSIndexPath) -> UITableViewCell { return UITableViewCell() }
    func cellForRowAtIndexPath(collectionView: UICollectionView, atIndexPath: NSIndexPath) -> UICollectionViewCell { return UICollectionViewCell() }
}