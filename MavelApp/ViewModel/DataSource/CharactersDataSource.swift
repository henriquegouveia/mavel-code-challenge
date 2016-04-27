//
//  CharactersDataSource.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/27/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation
import UIKit

class CharactersDataSource: NSObject {
    
    private var characters: [Character] = []
    
    func appendCharacters(characters: [Character]?) {
        if let characters = characters {
            self.characters.appendContentsOf(characters)
        }
    }
}

extension CharactersDataSource: ViewModelDataSourceProtocol {
    func cellForRowAtIndexPath(tableView: UITableView, atIndexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(metadata: CharacterTableViewCell.metadata, forIndexPath: atIndexPath)
        if let cell = cell as? CharacterTableViewCell {
            let viewModel = CharacterViewModel(character: self.characters[atIndexPath.row])
            cell.setupCell(viewModel)
        }

        return cell
    }
    
    func numberOfRows() -> Int {
        return characters.count
    }
    
    func numberOfSections() -> Int {
        return 1
    }
}