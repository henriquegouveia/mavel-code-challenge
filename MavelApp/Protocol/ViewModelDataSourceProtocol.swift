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
    func numberOfRows() -> Int
    func numberOfSections() -> Int
    func cellForRowAtIndexPath(tableView: UITableView, atIndexPath: NSIndexPath) -> UITableViewCell
}