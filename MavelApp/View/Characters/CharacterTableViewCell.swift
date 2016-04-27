//
//  CharactersView.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/24/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation
import UIKit
import Nuke

class CharacterTableViewCell: UITableViewCell {
    
    static let metadata: ReusableViewMetadata = CharacterViewCellMetadata()
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    
    func setupCell(viewModel: CharacterViewModel) {
        characterName.text = viewModel.character.name
        characterImageView.image = UIImage(named: "placeholder")
        characterImageView.nk_setImageWith(viewModel.characterImageURL)
    }
}

private class CharacterViewCellMetadata: ReusableViewMetadata {
    var reuseIdentifier: String {
        return "CharacterTableViewCell"
    }
}