//
//  ItemDetailView.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/28/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation
import UIKit
import Nuke

class CharacterDetailView: UIView {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var characterBookLabel: UILabel!
    @IBOutlet weak var comicDescriptionLabel: UILabel!
    
    func setupCharacterDetailView(viewModel: CharacterViewModel?) {
        if let viewModel = viewModel {
            self.characterBookLabel.text = viewModel.character.name
            self.comicDescriptionLabel.text = viewModel.character.sinopse
            if let imageURL = viewModel.character.thumbnail?.imageURL {
                self.backgroundImageView.nk_setImageWith(imageURL)
                self.coverImageView.nk_setImageWith(imageURL)
            }
        }
    }
}
