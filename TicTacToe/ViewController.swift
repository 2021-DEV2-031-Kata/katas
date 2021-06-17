//
//  ViewController.swift
//  TicTacToe
//
//  Created by Kata on 17/06/2021.
//

import UIKit

class ViewController: UIViewController {
    var game: Game = ViewController.createNewGame()

    private enum ViewProperties {
        static let fontSize: CGFloat = 32
        static let spacing: CGFloat = 2
    }

    let newGameButton: UIButton = {
        let button = UIButton()
        button.setTitle("New Game", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .orange
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapNewGameButton(sender:)), for: .touchUpInside)
        return button
    }()

    var defaultStatusLabelText: String {
        return "Make first mark: \(game.firstPlayer.mark)"
    }

    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = defaultStatusLabelText
        return label
    }()

    let boardContainer: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fillEqually
        view.spacing = ViewProperties.spacing
        return view
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

        view.addSubview(boardContainer)
        NSLayoutConstraint.activate([
            boardContainer.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            boardContainer.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            boardContainer.topAnchor.constraint(equalToSystemSpacingBelow: newGameButton.bottomAnchor, multiplier: 1),
            boardContainer.bottomAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: statusLabel.safeAreaLayoutGuide.topAnchor, multiplier: 1),
        ])

        drawBoard()
    }

    func drawBoard() {
        boardContainer.subviews.forEach { $0.removeFromSuperview() }

        for (i, row) in game.getBoard().enumerated() {
            let buttonContainer = UIStackView()
            buttonContainer.spacing = ViewProperties.spacing
            buttonContainer.distribution = .fillEqually

            for (j, col) in row.enumerated() {
                let button = makeGridButton(title: col)
                buttonContainer.addArrangedSubview(button)
            }

            boardContainer.addArrangedSubview(buttonContainer)
        }
    }

    @objc func didTapNewGameButton(sender _: UIButton) {
        debugPrint("User tapped New Game button")
        newGame()
    }

    func newGame() {
        game = ViewController.createNewGame()
        drawBoard()
        statusLabel.text = defaultStatusLabelText
    }

    private func makeGridButton(title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: ViewProperties.fontSize)
        return button
    }

    private static func createNewGame() -> Game {
        return Game(board: Board(), firstPlayer: Player(mark: "X"), secondPlayer: Player(mark: "O"))
    }
}
