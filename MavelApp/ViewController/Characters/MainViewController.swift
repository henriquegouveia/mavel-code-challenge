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
    private let client: CharactersClientType = CharactersClient()
    
    override func viewDidAppear(animated: Bool) {
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}