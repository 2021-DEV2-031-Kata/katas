//
//  Board.swift
//  TicTacToe
//
//  Created by Kata on 17/06/2021.
//

import Foundation

enum BoardError: Error {
    case illegalMarkPostion
}

struct Board {
    var state:[[String]]
    
    private let size: Int
    
    init(size: Int) {
        self.size = size
        state = Array<[String]>(repeating: Array<String>(repeating: "", count: size), count: size)
    }
    
    mutating func mark(_ row: Int, _ col: Int, mark: String) throws {
        guard row <= size, col <= size else {
            throw BoardError.illegalMarkPostion
        }
        
        state[row][col] = mark
    }
}
