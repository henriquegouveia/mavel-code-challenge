//
//  CharactersViewController.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/24/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    private var mediator: MediatorType = CharactersMediator()
    private var customView: MainView {
        return self.view as! MainView
    }
    
    override func viewDidAppear(animated: Bool) {
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.mediator.prepareForSegue(segue, sender: self)
    }
}

extension MainViewController: CharactersTableViewControllerProtocol {
    func failToGetList() {
        self.customView.errorMode()
    }
    
    func listLoaded() {
        self.customView.successMode()
    }
    
    func startingLoadMore() {
        print("loading more")
    }
}