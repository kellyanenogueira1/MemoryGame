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
    var chronometer: Chronometer?
 
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
        labelTime.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if memoryGame.isPlaying {
            resetGame()
        }
    }
  
    @IBAction func startGame(_ sender: Any) {
        labelTime.text = "00 : 00 : 00"
        labelTime.isHidden = false
        if let chronometer = chronometer {
            collectionView.isUserInteractionEnabled = false
            chronometer.end()
            self.chronometer = nil
            resetGame()
        } else {
            collectionView.isUserInteractionEnabled = true
            chronometer = Chronometer()
            chronometer?.delegate = self
        }
       
    }
    func setupCollectionView() {
        collectionView.isUserInteractionEnabled = false
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
        collectionView.visibleCells.forEach { cell in
            guard let cell = cell as? GameCollectionViewCell else { return }
            cell.wrapperView.backgroundColor = .blue
        }
        self.cards = memoryGame.newGame(totalCards: board.total)
        collectionView.reloadData()
    }
    
    func resetGame() {
        memoryGame.restartGame()
        setupNewGame()
    }
    
    func presentResult() {
        labelTime.isHidden = true
        guard let timeStr = labelTime.text else { return }
        let alert = UIAlertController(title: "Parabéns!", message: "você finalizou a partida em " + timeStr, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Sair", style: .cancel, handler: { _ in
            self.navigationController?.popViewController(animated: true)
        }))

        alert.addAction(UIAlertAction(title: "Jogar", style: .default, handler: { _ in
            self.collectionView.isUserInteractionEnabled = false
            self.resetGame()
            
        }))
      
        self.present(alert, animated: true)
    }
}
extension GameViewController: MemoryGameDelegate {
    func didEndGame() {
        if let chronometer = chronometer {
            chronometer.end()
            self.chronometer = nil
        }
        presentResult()
    }
}
extension GameViewController: ChronometerDelegate {
    func didUpdate() {
        self.labelTime.text = chronometer?.time
    }
}
