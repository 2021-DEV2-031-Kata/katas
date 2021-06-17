//
//  ViewControllerTests.swift
//  TicTacToeTests
//
//  Created by Kata on 17/06/2021.
//

@testable import TicTacToe
import XCTest

class ViewControllerTests: XCTestCase {
    func testViewControllerInitializedWillHaveGameInstanceConfigured() {
        let sut = ViewController()
        XCTAssertNotNil(sut.game)
    }

    func testViewControllerInitializedWillHaveCorrectNewButtonTitle() {
        let sut = ViewController()
        XCTAssertEqual(sut.newGameButton.titleLabel?.text, "New Game")
    }

    func testViewControllerInitializedStatusLabelWillHaveCorrectTitle() {
        let sut = ViewController()
        XCTAssertEqual(sut.statusLabel.text, "Make first mark: \(sut.game.firstPlayer.mark)")
    }

    func testViewControllerInitializedWillDisplayBoardWithCorrectNumberOfButtons() {
        let sut = ViewController()
        sut.loadViewIfNeeded()
        let buttons = sut.boardContainer.arrangedSubviews.reduce([]) { $0 + $1.subviews }
        XCTAssertEqual(buttons.count, 9)
    }
}
