//
//  Board.swift
//  TicTacToe
//
//  Created by Kata on 17/06/2021.
//

import Foundation

enum BoardError: Error {
    case illegalMarkPostion
    case alreadyMarkedPosition
}

struct Board {
    private(set) var state:[[String]]
    
    let size: Int
    
    init(size: Int = 3) {
        self.size = size
        state = Array<[String]>(repeating: Array<String>(repeating: "", count: size), count: size)
    }
    
    mutating func mark(_ row: Int, _ col: Int, mark: String) throws {
        guard row >= 0, row < size,
              col >= 0, col < size else {
            throw BoardError.illegalMarkPostion
        }
        
        guard state[row][col].isEmpty else {
            throw BoardError.alreadyMarkedPosition
        }
        
        state[row][col] = mark
    }
}
