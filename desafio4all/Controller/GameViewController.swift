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
    let rows: Int = 5
    let columns: Int = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setupCollectionView()
        // Do any additional setup after loading the view.
    }

    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = false
        collectionView.register(GameCollectionViewCell.self, forCellWithReuseIdentifier: GameCollectionViewCell.reuseIdentifier)
    }
    
    func centerCollection() {
        collectionView.contentInset.top = max((collectionView.frame.height -  collectionView.contentSize.height) / CGFloat(rows), 0)
    }

}

