//
//  PlayerTests.swift
//  TicTacToeTests
//
//  Created by Kata on 17/06/2021.
//

import XCTest
@testable import TicTacToe

class PlayerTests: XCTestCase {

    func testPlayerCorrectInitalization() {
        let player = Player(mark: "X")
        XCTAssertEqual(player.mark, "X")
    }
}
