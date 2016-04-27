//
//  CharactersTableViewController.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/27/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation
import UIKit

class CharactersTableViewController: UITableViewController {
    private let viewModel = CharactersViewModel()
    
    override func viewDidLoad() {
        self.viewModel.getCharactersList({ 
            self.tableView.reloadData()
            }) { (message) in
                print(message)
        }
    }
    
    func insertRowsAtIndexPaths(indexPaths: [NSIndexPath]) {
        self.tableView.beginUpdates()
        self.tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.Bottom)
        self.tableView.endUpdates()
    }
}

//MARK: DataSource Implementation

extension CharactersTableViewController {
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120.0
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.viewModel.numberOfSections()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRows()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return self.viewModel.cellForRowAtIndexPath(self.tableView, atIndexPath: indexPath)
    }
}

//MARK: UIScrollViewDelegate

extension CharactersTableViewController {
    override func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        print(targetContentOffset.memory.y)
    }
}