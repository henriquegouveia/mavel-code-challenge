//
//  CharactersTableViewController.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/27/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation
import UIKit

protocol CharactersTableViewControllerProtocol: class {
    func listLoaded()
    func failToGetList()
    func startingLoadMore()
}

class CharactersTableViewController: UITableViewController, MediatorProtocol {
    private let viewModel = CharactersViewModel()
    weak var delegate: CharactersTableViewControllerProtocol?
    
    var mediator: MediatorType? = CharactersMediator()
    
    override func viewDidLoad() {
        self.getMoreData()
    }
    
    private func getMoreData() {
        self.viewModel.getCharactersList({ newRows in
            self.insertRowsAtIndexPaths(newRows)
            self.delegate?.listLoaded()
        }) { (message) in
            if self.viewModel.theresAnyContentToBeShown {
                self.delegate?.failToGetList()
            }
        }
    }
    
    func insertRowsAtIndexPaths(indexPaths: [NSIndexPath]) {
        self.tableView.beginUpdates()
        self.tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.Bottom)
        self.tableView.endUpdates()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.mediator?.prepareForSegue(segue, sender: sender)
    }
}

//MARK: DataSource Implementation

extension CharactersTableViewController {
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 128.0
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.viewModel.numberOfSections()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRows(section)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return self.viewModel.cellForRowAtIndexPath(self.tableView, atIndexPath: indexPath)
    }
}

//MARK: Delegate Implementation

extension CharactersTableViewController {
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let character = self.viewModel.characterByIndexPath(indexPath)
        self.performSegueWithIdentifier("fromCharactersListToCharacterDetail", sender: character)
    }
}

//MARK: UIScrollViewDelegate

extension CharactersTableViewController {
    override func scrollViewWillEndDragging(scrollView: UIScrollView,
                                            withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if targetContentOffset.memory.y > 1900 {
            self.delegate?.startingLoadMore()
            self.getMoreData()
        }
    }
}