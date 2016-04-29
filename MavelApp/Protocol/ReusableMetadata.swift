//
//  ReusableMetadata.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/27/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation

protocol ReusableViewMetadata {
    var reuseIdentifier: String { get }
}

extension ReusableViewMetadata {
    var nibName: String? {
        return reuseIdentifier
    }
}