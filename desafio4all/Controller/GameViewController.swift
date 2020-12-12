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
    var rows: Int?
    var columns: Int?
    var sequence: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setupCollectionView()
        generateArray()
    }
    
    init? (coder: NSCoder, rows: Int?, collumns: Int?) {
        self.rows = rows
        self.columns = collumns
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = false
        collectionView.register(GameCollectionViewCell.self, forCellWithReuseIdentifier: GameCollectionViewCell.reuseIdentifier)
    }
    
    func centerCollection() {
        collectionView.contentInset.top = max((collectionView.frame.height -  collectionView.contentSize.height) / CGFloat(rows!), 0)
    }
    
    func generateArray() {
        if let rows = rows, let columns = columns {
            let total = (rows * columns) / 2
            sequence.append(contentsOf: 1...total)
            sequence.append(contentsOf: 1...total)
        }
        sequence = sequence.shuffled()
    }

}

