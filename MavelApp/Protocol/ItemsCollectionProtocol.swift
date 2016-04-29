//
//  ItemsCollectionProtocol.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/27/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation

protocol ItemsCollectionProtocol {
    var collectionName: String { get }
    var collection: [Item]? { get }
}