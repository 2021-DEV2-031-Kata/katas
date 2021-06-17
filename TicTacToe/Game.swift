//
//  Game.swift
//  TicTacToe
//
//  Created by Kata on 17/06/2021.
//

import Foundation

struct Game {
    
    private(set) var board: Board
    let firstPlayer: Player
    let secondPlayer: Player
    
    var currentPlayer: Player {
        return firstPlayer
    }
    
    mutating func play(_ row: Int, _ col: Int) {
        try? board.mark(row, col, mark: currentPlayer.mark)
    }
    
}
