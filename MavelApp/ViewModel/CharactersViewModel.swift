//
//  CharactersViewModel.swift
//  MavelApp
//
//  Created by Henrique Cesar Gouveia on 4/27/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import Foundation
import UIKit

typealias CharactersResultWithSuccess = () -> Void
typealias CharactersResultWithFailure = (message: String) -> Void

class CharactersViewModel {
    private let limit: Int = 20
    private var offset: Int = 0
    private var total: Int = 0
    
    private var client: CharactersClientType = CharactersClient()
    private var dataSource: CharactersDataSource = CharactersDataSource()
    
    private func configureOffset(total: Int?) -> [NSIndexPath] {
        
        let newRows = (self.offset...self.limit)
        
        self.offset += self.limit
        if let total = total {
            self.total = total
        }
        
        return newRows.map { NSIndexPath(forRow: $0, inSection: 1) }
    }
    
    func getCharactersList(completionWithSuccess: CharactersResultWithSuccess, completionWithFailure: CharactersResultWithFailure) {
        self.client.listCharacters(self.limit, offset: self.offset) { result in
            switch result {
            case .Success(let result):
                self.configureOffset(result.total)
                self.dataSource.appendCharacters(result.characters)
                completionWithSuccess()
            case .Failure(let error):
                completionWithFailure(message: error.description)
            }
        }
    }
}

//MARK: Handle DataSource Stuffs

extension CharactersViewModel: ViewModelDataSourceProtocol {
    
    func numberOfRows() -> Int {
        return dataSource.numberOfRows()
    }
    
    func numberOfSections() -> Int {
        return dataSource.numberOfSections()
    }
    
    func cellForRowAtIndexPath(tableView: UITableView, atIndexPath: NSIndexPath) -> UITableViewCell {
        return self.dataSource.cellForRowAtIndexPath(tableView, atIndexPath: atIndexPath)
    }
}
