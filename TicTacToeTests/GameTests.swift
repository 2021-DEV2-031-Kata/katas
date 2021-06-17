//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Kata on 17/06/2021.
//

@testable import TicTacToe
import XCTest

class GameTests: XCTestCase {
    func testGameConfiguredWithPlayerSetsPlayers() {
        let firstPlayer = Player(mark: "X")
        let secondPlayer = Player(mark: "O")
        let game = Game(board: Board(), firstPlayer: firstPlayer, secondPlayer: secondPlayer)
        XCTAssertEqual(game.firstPlayer, firstPlayer)
        XCTAssertEqual(game.secondPlayer, secondPlayer)
    }

    func testGameConfiguredWithPlayerSetsCurrentPlayer() {
        let firstPlayer = Player(mark: "X")
        let secondPlayer = Player(mark: "O")
        let game = Game(board: Board(), firstPlayer: firstPlayer, secondPlayer: secondPlayer)
        XCTAssertEqual(game.currentPlayer, firstPlayer)
    }

    func testGamePlayingGameMarksCorrectPositionOnTheBoard() {
        var game = Game(board: Board(), firstPlayer: Player(mark: "X"), secondPlayer: Player(mark: "O"))
        game.play(0, 0)
        let board = game.getBoard()
        XCTAssertEqual(board, createBoardWithWithMarkedPosition(size: 3, mark: (row: 0, col: 0, value: "X")))
    }

    func testGamePlayingGameChagnesTurnToSecondPlayer() {
        var game = Game(board: Board(), firstPlayer: Player(mark: "X"), secondPlayer: Player(mark: "O"))
        game.play(0, 0)
        XCTAssertEqual(game.currentPlayer, Player(mark: "O"))
    }

    func testGamePlayingGameForTwoTurnsChagnesTurnToFirstPlayer() {
        var game = Game(board: Board(), firstPlayer: Player(mark: "X"), secondPlayer: Player(mark: "O"))
        game.play(0, 0)
        game.play(0, 1)
        XCTAssertEqual(game.currentPlayer, Player(mark: "X"))
    }

    func testGameMarkingAllPositionsByOnePlayerAlongARowResultInWinningState() {
        var game = Game(board: Board(), firstPlayer: Player(mark: "X"), secondPlayer: Player(mark: "O"))
        game.play(0, 0)
        game.play(1, 0)
        game.play(0, 1)
        game.play(1, 1)
        game.play(0, 2)
        XCTAssertEqual(game.state, .win(player: "X"))
    }

    func testGameMarkingAllPositionsByOnePlayerAlongAColumnResultInWinningState() {
        var game = Game(board: Board(), firstPlayer: Player(mark: "X"), secondPlayer: Player(mark: "O"))
        game.play(0, 1)
        game.play(1, 0)
        game.play(1, 1)
        game.play(2, 0)
        game.play(2, 1)
        XCTAssertEqual(game.state, .win(player: "X"))
    }

    func testGameMarkingAllPositionsByOnePlayerAlongPrincipalDiagonalResultInWinningState() {
        var game = Game(board: Board(), firstPlayer: Player(mark: "X"), secondPlayer: Player(mark: "O"))

        /*
         O X .
         X O .
         . X O
         */

        game.play(0, 1)
        game.play(0, 0)
        game.play(1, 0)
        game.play(1, 1)
        game.play(2, 1)
        game.play(2, 2)
        XCTAssertEqual(game.state, .win(player: "O"))
    }

    func testGameMarkingAllPositionsByOnePlayerAlongMinorDiagonalResultInWinningState() {
        var game = Game(board: Board(), firstPlayer: Player(mark: "X"), secondPlayer: Player(mark: "O"))

        /*
         O . X
         O X .
         X . .
         */

        game.play(0, 2)
        game.play(0, 0)
        game.play(1, 1)
        game.play(1, 0)
        game.play(2, 0)
        XCTAssertEqual(game.state, .win(player: "X"))
    }

    func testGameMarkingAllPositionsWithoutAWinResultsInATieGame() {
        var game = Game(board: Board(), firstPlayer: Player(mark: "X"), secondPlayer: Player(mark: "O"))

        /*
         X O X
         O X X
         O X O
         */

        game.play(0, 0)
        game.play(0, 1)
        game.play(0, 2)
        game.play(1, 0)
        game.play(1, 1)
        game.play(2, 0)
        game.play(2, 1)
        game.play(2, 2)
        game.play(1, 2)

        XCTAssertEqual(game.state, .tie)
    }

    func testGameWhenPlayerWinsPreventExtraMarks() {
        var game = Game(board: Board(), firstPlayer: Player(mark: "X"), secondPlayer: Player(mark: "O"))

        /*
         O . X
         O X .
         X . .
         */

        game.play(0, 2)
        game.play(0, 0)
        game.play(1, 1)
        game.play(1, 0)
        game.play(2, 0)
        game.play(0, 1)

        let marks = game.getBoard().reduce([], +).filter { !$0.isEmpty }.count
        XCTAssertEqual(marks, 5)
    }

    func testGameWhenPlayingAnAlreadyMarkedPositionYieldsError() {
        var game = Game(board: Board(), firstPlayer: Player(mark: "X"), secondPlayer: Player(mark: "O"))

        game.play(0, 0)
        game.play(0, 0)
        XCTAssertEqual(game.state, .error("Cannot mark alrady marked position"))
    }

    func testGameWhenPlayingAnAlreadyMarkedPositionPlayerCanContinueOnCorrectPosition() {
        var game = Game(board: Board(), firstPlayer: Player(mark: "X"), secondPlayer: Player(mark: "O"))

        game.play(0, 0)
        game.play(0, 0)
        game.play(1, 0)
        XCTAssertEqual(game.state, .ongoing)
    }

    private func createBoardWithWithMarkedPosition(size: Int = 3, mark: (row: Int, col: Int, value: String)) -> [[String]] {
        var board = [[String]](repeating: [String](repeating: "", count: size), count: size)
        board[mark.row][mark.col] = mark.value
        return board
    }
}
