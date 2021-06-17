//
//  ViewController.swift
//  TicTacToe
//
//  Created by Kata on 17/06/2021.
//

import UIKit

class ViewController: UIViewController {
    var game: Game = ViewController.createNewGame()

    let newGameButton: UIButton = {
        let button = UIButton()
        button.setTitle("New Game", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .orange
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Make first mark: \(game.firstPlayer.mark)"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    private static func createNewGame() -> Game {
        return Game(board: Board(), firstPlayer: Player(mark: "X"), secondPlayer: Player(mark: "O"))
    }
}
