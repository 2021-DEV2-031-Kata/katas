//
//  BoardTests.swift
//  TicTacToeTests
//
//  Created by Kata on 17/06/2021.
//

import XCTest
@testable import TicTacToe

class BoardTests: XCTestCase {

    func testBoardInitializesBoardWithCorrectNumberOfRows() {
        let board = Board(size: 3)
        XCTAssertTrue(board.state.count == 3)
    }
    
}