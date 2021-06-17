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

    func testViewControllerTappingNewGameButtonRestartsTheGame() {
        let sut = ViewController()
        sut.game.play(0, 1)
        var markedPosition = sut.game.getBoard().reduce([], +).filter { !$0.isEmpty }
        XCTAssertEqual(markedPosition.count, 1)

        sut.didTapNewGameButton(sender: sut.newGameButton)

        markedPosition = sut.game.getBoard().reduce([], +).filter { !$0.isEmpty }
        XCTAssertEqual(markedPosition.count, 0)
    }

    func testViewControllerRestartingTheGameShouldKeepSameConfiguration() {
        let expectedBoardSize = 4
        let game = Game(board: Board(size: expectedBoardSize), firstPlayer: Player(mark: "X"), secondPlayer: Player(mark: "O"))
        let sut = ViewController()
        sut.game = game
        sut.newGame()
        let numberOfMarks = sut.game.getBoard().reduce([], +)
        XCTAssertEqual(expectedBoardSize * expectedBoardSize, numberOfMarks.count)
    }
}
