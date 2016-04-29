//
//  MavelAppTests.swift
//  MavelAppTests
//
//  Created by Henrique Cesar Gouveia on 4/24/16.
//  Copyright © 2016 Henrique Gouveia. All rights reserved.
//

import XCTest
import Nimble
import Alamofire
import OHHTTPStubs
import Argo
@testable import MavelApp

class MavelAppTests: XCTestCase {
    
    override func setUp() {
        stubFlirtList()
    }
    
    override func tearDown() {
        OHHTTPStubs.removeAllStubs()
    }
    
    func testExample() {
        var result: Result<CharactersCollection, MarvelAPIClientError>!
        let client = CharactersClient()
        client.listCharacters { charactersCollection in
            result = charactersCollection
        }
        
        expect(result).toEventuallyNot(beNil())
        expect(result.value).toEventuallyNot(beNil())
        expect(result.value?.characters?.count).toEventually(equal(20))
    }
}

private extension MavelAppTests {
    func stubFlirtList() {
        stubRequest(methodCondition: isMethodGET(), fixtureFile: "characters.json")
    }
    
    func stubRequest(methodCondition isMethod: OHHTTPStubsTestBlock, fixtureFile: String) {
        stub(pathStartsWith("/characters") && isMethod) { _ in
            let fixturePath = OHPathForFile(fixtureFile, self.dynamicType)
            return fixture(fixturePath!, headers: ["Content-Type":"application/json"])
        }
    }
}