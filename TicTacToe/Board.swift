//
//  Board.swift
//  TicTacToe
//
//  Created by Kata on 17/06/2021.
//

import Foundation

struct Board {
    var state:[[String]]
    
    init(size: Int) {
        state = Array<[String]>(repeating: Array<String>(repeating: "", count: size), count: size)
    }
}
