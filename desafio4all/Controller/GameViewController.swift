//
//  GameViewController.swift
//  desafio4all
//
//  Created by Lidiane Gomes Barbosa on 11/12/20.
//

import UIKit
protocol MemoryGameDelegate: class {
    func didEndGame()
}
class GameViewController: UIViewController {
    
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var buttonStart: UIButton!
    let board: Board
    let memoryGame = MemoryGame()
    var cards = [Card]()
    init? (coder: NSCoder, rows: Int, collumns: Int) {
        board = Board(rows: rows, columns: collumns)
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupNewGame()
        memoryGame.delegate = self
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if memoryGame.isPlaying {
            resetGame()
        }
    }
    @IBAction func startGame(_ sender: Any) {
        resetGame()
    }
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = false
        collectionView.allowsMultipleSelection = true
        collectionView.register(GameCollectionViewCell.self, forCellWithReuseIdentifier: GameCollectionViewCell.reuseIdentifier)
    }
    
    func centerCollection() {
        collectionView.contentInset.top = max((collectionView.frame.height -  collectionView.contentSize.height) / CGFloat(board.rows), 0)
    }
    
    func setupNewGame() {
        self.cards = memoryGame.newGame(totalCards: board.total)
        collectionView.reloadData()
    }
    
    func resetGame() {
        memoryGame.restartGame()
        setupNewGame()
    }
}
extension GameViewController: MemoryGameDelegate {
    func didEndGame() {
        resetGame()
    }
}
