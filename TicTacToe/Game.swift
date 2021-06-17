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

    private var board: Board
    private(set) var currentPlayer: Player
    
    private(set) var state: GameState = .ongoing
    
    init(board: Board, firstPlayer: Player, secondPlayer: Player) {
        self.board = board
        self.firstPlayer = firstPlayer
        self.secondPlayer = secondPlayer
        self.currentPlayer = firstPlayer
    }
    
    mutating func play(_ row: Int, _ col: Int) {
        
        guard case .ongoing = state else { return }
        
        try? board.mark(row, col, mark: currentPlayer.mark)
        
        if checkWinningState() {
            state = .win(player: currentPlayer.mark)
        } else if checkATieGameState() {
            state = .tie
        } else {
            currentPlayer = changePlayer()
        }
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
        return checkWinningStateAlongRows() || checkWinningStateAlongColumns()
            || checkWinningStateAlongDiagonals() || checkWinningStateAlongMinorDiagonal()
    }
    
    private func checkWinningStateAlongRows() -> Bool {
        return board.state.map { $0.allSatisfy { $0 == currentPlayer.mark }}.first { $0 } ?? false
    }
    
    private func checkWinningStateAlongColumns() -> Bool {
        let columns = transpose(matrix: board.state)
        return columns.map { $0.allSatisfy { $0 == currentPlayer.mark }}.first { $0 } ?? false
    }
    
    private func checkWinningStateAlongDiagonals() -> Bool {
        var boardState = board.state
        return boardState.principalDiagonal().allSatisfy { $0 == currentPlayer.mark }
    }
    
    private func checkWinningStateAlongMinorDiagonal() -> Bool {
        var boardState:[[String]] = board.state.reversed()
        return boardState.principalDiagonal().allSatisfy { $0 == currentPlayer.mark }
    }
    
    private func checkATieGameState() -> Bool {
        return board.state.reduce([], +).allSatisfy { !$0.isEmpty }
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

public extension Array {
    mutating func principalDiagonal<Element>(index: Int = 0, result: [Element] = []) -> [Element] where Self.Element == [Element] {
        guard !isEmpty else {
            return result
        }
        var result = result
        result.append(removeFirst()[index])
        return principalDiagonal(index: index + 1, result: result)
    }
}
