//
//  CharacterDetailViewController.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/27/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation
import UIKit

class CharacterDetailViewController: UIViewController, MediatorProtocol {
    private var customView: CharacterDetailView? {
        if let customView = self.view as? CharacterDetailView {
            return customView
        }
        
        return nil
    }
    
    private var viewModel: CharacterViewModel?
    internal var mediator: MediatorType?
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    func setupMediator(mediator: MediatorType, andObject object: AnyObject?) {
        self.mediator = mediator
        
        if let object = object as? Character {
            self.viewModel = CharacterViewModel(character: object)
            self.customView?.setupCharacterDetailView(self.viewModel)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.mediator?.prepareForSegue(segue, sender: self.viewModel?.character)
    }
    
    //MARK: Actions
    
    @IBAction func back(sender: UIButton) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}