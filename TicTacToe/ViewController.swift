//
//  ViewController.swift
//  TicTacToe
//
//  Created by Kata on 17/06/2021.
//

import UIKit

class ViewController: UIViewController {
    var game: Game = ViewController.createNewGame()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    private static func createNewGame() -> Game {
        return Game(board: Board(), firstPlayer: Player(mark: "X"), secondPlayer: Player(mark: "O"))
    }
}
