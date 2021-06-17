//
//  Game.swift
//  TicTacToe
//
//  Created by Kata on 17/06/2021.
//

import Foundation

struct Game {
    
    private(set) var firstPlayer: Player
    private(set) var secondPlayer: Player
    
    var currentPlayer: Player {
        return firstPlayer
    }
    
    init(firstPlayer: Player, secondPlayer: Player) {
        self.firstPlayer = firstPlayer
        self.secondPlayer = secondPlayer
    }
    
}
