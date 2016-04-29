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
    
    @IBOutlet weak var loadingImage: UIActivityIndicatorView!
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    
    private func setupAppearance() {
        self.shadowInBackgroundTitle()
    }
    
    private func shadowInBackgroundTitle() {
        self.characterName.layer.masksToBounds = false
        self.characterName.layer.shadowRadius = 5
        self.characterName.layer.shadowOffset = CGSizeMake(-0, 10)
        self.characterName.layer.shadowOpacity = 0.5
        
//        self.characterName.layer.shadowPath = UIBezierPath.pat
    }
    
    func setupCell(viewModel: CharacterViewModel) {
        self.setupAppearance()
        
        characterName.text = viewModel.character.name
        loadingImage.startAnimating()
        characterImageView.image = nil
        if let imageURL = viewModel.character.thumbnail?.imageURL {
            characterImageView.nk_setImageWith(imageURL)
        }
    }
}

private class CharacterViewCellMetadata: ReusableViewMetadata {
    var reuseIdentifier: String {
        return "CharacterTableViewCell"
    }
}