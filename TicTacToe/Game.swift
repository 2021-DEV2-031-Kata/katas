//
//  Game.swift
//  TicTacToe
//
//  Created by Kata on 17/06/2021.
//

import Foundation

enum GameState: Equatable {
    case ongoing
    case win(player: String)
    case tie
    case error(String)
}

struct Game {
    
    let firstPlayer: Player
    let secondPlayer: Player

    private(set) var board: Board
    private(set) var currentPlayer: Player
    
    private(set) var state: GameState = .ongoing
    
    init(board: Board, firstPlayer: Player, secondPlayer: Player) {
        self.board = board
        self.firstPlayer = firstPlayer
        self.secondPlayer = secondPlayer
        self.currentPlayer = firstPlayer
    }
    
    mutating func play(_ row: Int, _ col: Int) {
        try? board.mark(row, col, mark: currentPlayer.mark)
        
        if checkWinningState() || checkWinningStateAlongColumns() {
            state = .win(player: currentPlayer.mark)
        }
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
    
    private func checkWinningState() -> Bool {
        return board.state.map { $0.allSatisfy { $0 == currentPlayer.mark }}.first { $0 } ?? false
    }
    
    private func checkWinningStateAlongColumns() -> Bool {
        let columns = transpose(matrix: board.state)
        return columns.map { $0.allSatisfy { $0 == currentPlayer.mark }}.first { $0 } ?? false
    }
    
    private func transpose(matrix: [[String]]) -> [[String]] {
        var result: [[String]] = Array<[String]>(repeating: Array<String>(repeating: "", count: board.size), count: board.size)
        
        for i in 0..<matrix.count {
            for j in 0..<matrix.count {
                result[i][j] = matrix[j][i]
            }
        }
        return result
    }
    
}
