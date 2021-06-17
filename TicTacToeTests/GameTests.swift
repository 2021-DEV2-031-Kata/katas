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
        game.currentPlayer = firstPlayer
    }
  
}
