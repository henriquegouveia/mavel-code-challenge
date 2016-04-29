//
//  MainView.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/28/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation
import UIKit

class MainView: UIView {
    
    @IBOutlet weak var charactersContainer: UIView!
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var loadingView: UIView!
    
    func errorMode() {
        self.loadingView.hidden = true
        self.charactersContainer.hidden = true
        
        self.errorView.hidden = false
    }
    
    func successMode() {
        self.loadingView.hidden = true
        self.errorView.hidden = true
        
        self.charactersContainer.hidden = false
    }
}