//
//  PlayerTests.swift
//  TicTacToeTests
//
//  Created by Kata on 17/06/2021.
//

@testable import TicTacToe
import XCTest

class PlayerTests: XCTestCase {
    func testPlayerCorrectInitalization() {
        let player = Player(mark: "X")
        XCTAssertEqual(player.mark, "X")
    }
}
