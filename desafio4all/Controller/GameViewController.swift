//
//  GameViewController.swift
//  desafio4all
//
//  Created by Lidiane Gomes Barbosa on 11/12/20.
//

import UIKit
class GameViewController: UIViewController {
    
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var buttonStart: UIButton!
    let board: Board?
    var sequenceNumbers: [Int] = []
    
    
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
        sequenceNumbers = generateSequence()
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = false
        collectionView.allowsMultipleSelection = true
        collectionView.register(GameCollectionViewCell.self, forCellWithReuseIdentifier: GameCollectionViewCell.reuseIdentifier)
    }
    
    func centerCollection() {
        if let board = board {
            collectionView.contentInset.top = max((collectionView.frame.height -  collectionView.contentSize.height) / CGFloat(board.rows), 0)
        }
    }
    
    func generateSequence() -> [Int] {
        var sequence: [Int] = []
        if let board = board {
            let totalNumbers = board.total / 2
            sequence.append(contentsOf: 1...totalNumbers)
            sequence.append(contentsOf: 1...totalNumbers)
        }
        return sequence.shuffled()
    }
}
