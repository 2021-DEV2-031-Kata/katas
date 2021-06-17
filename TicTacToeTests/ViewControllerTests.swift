//
//  ViewControllerTests.swift
//  TicTacToeTests
//
//  Created by Kata on 17/06/2021.
//

import XCTest
@testable import TicTacToe

class ViewControllerTests: XCTestCase {

    
    func testViewControllerInitializedWillHaveGameInstanceConfigured() {
        let sut = ViewController()
        XCTAssertNotNil(sut.game)
    }

}
