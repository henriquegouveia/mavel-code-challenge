//
//  MarvelAPIClientDelegate.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/26/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation

protocol MarvelAPIClientDelegate: class {
    func marvelClient(client: MarvelAPIClientType,
                   gotError error: MarvelAPIClientError,
                            forRequest request: NSURLRequest?)
}
