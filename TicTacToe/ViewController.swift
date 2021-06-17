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
        view.addSubview(newGameButton)
        NSLayoutConstraint.activate([
            newGameButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
            newGameButton.widthAnchor.constraint(equalToConstant: 200),
            newGameButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            newGameButton.heightAnchor.constraint(equalToConstant: 50),
        ])

        view.addSubview(statusLabel)
        NSLayoutConstraint.activate([
            statusLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 1),
            statusLabel.trailingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.trailingAnchor, multiplier: 1),
            statusLabel.bottomAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.bottomAnchor, multiplier: 1),
            statusLabel.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    private static func createNewGame() -> Game {
        return Game(board: Board(), firstPlayer: Player(mark: "X"), secondPlayer: Player(mark: "O"))
    }
}
