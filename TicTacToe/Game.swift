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
    
    var currentPlayer: Player {
        return firstPlayer
    }
    
}
