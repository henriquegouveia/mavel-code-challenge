//
//  CharactersMediator.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/27/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation
import UIKit


protocol MediatorType {
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
}

class CharactersMediator: MediatorType {
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "fromCharactersListToCharacterDetail" {
            if let destination = segue.destinationViewController as? CharacterDetailViewController {
                destination.setupMediator(self, andObject: sender)
            }
        } else if segue.identifier == "embededItemsListInCharacterDetail" {
            if let destination = segue.destinationViewController as? ItemsTableViewController {
                if let sender = sender as? Character {
                    destination.character = sender
                }
            }
        } else if segue.identifier == "embededCharactersListInMainView" {
            if let destination = segue.destinationViewController as? CharactersTableViewController {
                if let delegate = sender as? CharactersTableViewControllerProtocol {
                    destination.delegate = delegate
                }
            }
        }
    }
}

