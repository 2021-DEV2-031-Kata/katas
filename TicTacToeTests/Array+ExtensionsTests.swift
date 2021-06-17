//
//  Array+ExtensionsTests.swift
//  TicTacToeTests
//
//  Created by Kata on 17/06/2021.
//

import XCTest

class Array_ExtensionsTests: XCTestCase {
    func testMatrixExtractValuesAlongDiagonal() {
        var matrix = [
            ["X", "A", "B"],
            ["D", "X", "C"],
            ["E", "F", "X"],
        ]

        let diagonal = matrix.principalDiagonal()
        XCTAssertEqual(diagonal, ["X", "X", "X"])
    }

    func testMatrixExtractValuesAlongDiagonalReverse() {
        var matrix = [
            ["X", "A", "Y"],
            ["D", "Y", "C"],
            ["Y", "F", "X"],
        ]

        var reversed: [[String]] = matrix.reversed()
        let diagonal = reversed.principalDiagonal()
        XCTAssertEqual(diagonal, ["Y", "Y", "Y"])
    }
}
