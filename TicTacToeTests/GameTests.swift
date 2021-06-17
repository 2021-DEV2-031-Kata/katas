//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Kata on 17/06/2021.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    func testGameConfiguredWithPlayerSetsPlayers() {
        let firstPlayer = Player(mark: "X")
        let secondPlayer = Player(mark: "O")
        let game = Game(firstPlayer: firstPlayer, secondPlayer: secondPlayer)
        XCTAssertEqual(game.firstPlayer, firstPlayer)
        XCTAssertEqual(game.secondPlayer, secondPlayer)
    }
    
    func testGameConfiguredWithPlayerSetsCurrentPlayer() {
        let firstPlayer = Player(mark: "X")
        let secondPlayer = Player(mark: "O")
        let game = Game(firstPlayer: firstPlayer, secondPlayer: secondPlayer)
        XCTAssertEqual(game.currentPlayer, firstPlayer)
    }
    
    func testGamePlayingGameMarksCorrectPositionOnTheBoard() {
        let game = Game(firstPlayer: Player(mark: "X"), secondPlayer: Player(mark: "O"))
        game.play(0, 0)
        let board = game.getBoard()
        XCTAssertEqual(board, createBoardWithWithMarkedPosition(size: 3, mark: (row: 0, col: 0,  value: "X")))
    }
    
    private func createBoardWithWithMarkedPosition(size: Int = 3, mark: (row: Int, col: Int, value: String)) -> [[String]] {
        var board = Array<[String]>(repeating: Array<String>(repeating: "", count: size), count: size)
        board[mark.row][mark.col] = mark.value
        return board
    }
  
}
