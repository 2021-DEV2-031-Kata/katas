//
//  BoardTests.swift
//  TicTacToeTests
//
//  Created by Kata on 17/06/2021.
//

@testable import TicTacToe
import XCTest

class BoardTests: XCTestCase {
    func testBoardInitializesBoardWithCorrectNumberOfRows() {
        let board = Board(size: 3)
        XCTAssertTrue(board.state.count == 3)
    }

    func testBoardInitializesBoardWithCorrectNumberOfCols() {
        let board = Board(size: 3)
        XCTAssertTrue(board.state[0].count == 3)
    }

    func testBoardSettingAMarkSetsAMark() throws {
        var board = Board(size: 3)
        try board.mark(0, 0, mark: "X")
        XCTAssertEqual(board.state[0][0], "X")
    }

    func testBoardSettingMarkAtIllegalLocationThrowsAnError() throws {
        var board = Board(size: 3)
        XCTAssertThrowsError(try board.mark(20, 20, mark: "X")) { error in
            XCTAssertEqual(error as? BoardError, BoardError.illegalMarkPostion)
        }
    }

    func testBoardSettingMarkAtMarkedPositionThrowsError() throws {
        var board = Board(size: 3)
        try board.mark(0, 0, mark: "X")
        XCTAssertThrowsError(try board.mark(0, 0, mark: "X")) { error in
            XCTAssertEqual(error as? BoardError, BoardError.alreadyMarkedPosition)
        }
    }

    func testBoardSettingMarkAtINegativePositionThrowsAnError() throws {
        var board = Board(size: 3)
        XCTAssertThrowsError(try board.mark(-1, -2, mark: "X")) { error in
            XCTAssertEqual(error as? BoardError, BoardError.illegalMarkPostion)
        }
    }

    func testBoardSettingMarkAtPositionThatsGreaterThanBoardThrowsAnError() throws {
        var board = Board(size: 3)

        // It must NOT be possible to provide a value greater than 2, because size of the array is 3
        // so the guard must verify if the utmost position of the mark less than the size configuration

        XCTAssertThrowsError(try board.mark(3, 3, mark: "X")) { error in
            XCTAssertEqual(error as? BoardError, BoardError.illegalMarkPostion)
        }
    }
}
