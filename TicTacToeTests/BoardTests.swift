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
    
    func testBoardInitializesBoardWithCorrectNumberOfCols() {
        let board = Board(size: 3)
        XCTAssertTrue(board.state[0].count == 3)
    }
    
    func testBoardSettingAMarkSetsAMark() {
        let board = Board(size: 3)
        board.mark(0,0, mark: "X")
        XCTAssertEqual(board.state[0][0], "X")
    }
    
}
