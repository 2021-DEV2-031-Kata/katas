//
//  Game.swift
//  TicTacToe
//
//  Created by Kata on 17/06/2021.
//

import Foundation

struct Game {
    
    let firstPlayer: Player
    let secondPlayer: Player

    private(set) var board: Board
    private(set) var currentPlayer: Player
    
    init(board: Board, firstPlayer: Player, secondPlayer: Player) {
        self.board = board
        self.firstPlayer = firstPlayer
        self.secondPlayer = secondPlayer
        self.currentPlayer = firstPlayer
    }
    
    mutating func play(_ row: Int, _ col: Int) {
        try? board.mark(row, col, mark: currentPlayer.mark)
        currentPlayer = changePlayer()
    }
    
    func getBoard() -> [[String]] {
        return board.state
    }
    
    private func changePlayer() -> Player {
        if currentPlayer.mark == firstPlayer.mark {
            return secondPlayer
        }
        return firstPlayer
    }
    
}
