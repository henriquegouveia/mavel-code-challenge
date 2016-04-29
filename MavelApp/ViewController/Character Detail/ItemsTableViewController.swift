//
//  ItemsTableViewController.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/27/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation
import UIKit

class ItemsTableViewController: UITableViewController {
    private var viewModel: ItemsViewModel = ItemsViewModel()
    var character: Character? {
        didSet {
            self.viewModel = ItemsViewModel(character: self.character)
        }
    }
    
    func buildItemsToBeShown() {
        
    }
    
    override func viewDidLayoutSubviews() {
        //TODO: It must be in a view layer
        let superview = self.view.superview
        let views = ["view": self.view]
        let height = self.tableView.contentSize.height
        let verticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|[view(==\(height))]",
                                                                                 options: NSLayoutFormatOptions(rawValue: 0),
                                                                                 metrics: nil,
                                                                                 views: views)
        let horizontalConstaints = NSLayoutConstraint.constraintsWithVisualFormat("H:|[view]|",
                                                                                  options: NSLayoutFormatOptions(rawValue: 0),
                                                                                  metrics: nil,
                                                                                  views: views)
        superview?.addConstraints(verticalConstraints)
        superview?.addConstraints(horizontalConstaints)
    }
}

//MARK: DataSource Implementation

extension ItemsTableViewController {
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return self.viewModel.cellForRowAtIndexPath(self.tableView, atIndexPath: indexPath)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.viewModel.numberOfSections()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRows(section)
    }
}