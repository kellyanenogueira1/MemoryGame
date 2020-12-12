//
//  GameView+CollectionDelegate.swift
//  desafio4all
//
//  Created by Lidiane Gomes Barbosa on 12/12/20.
//

import Foundation
import UIKit
extension GameViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        rows * columns
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCollectionViewCell.reuseIdentifier, for: indexPath) as? GameCollectionViewCell else { fatalError() }
       centerCollection()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("clicou")
    }
    
}

extension GameViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let viewWidth = self.collectionView.frame.width
        let cellSize = calculateCellSize(viewWidth: viewWidth, columns: columns)
        return CGSize(width: cellSize, height: cellSize)
    }
}

func calculateCellSize(viewWidth: CGFloat, columns: Int) -> CGFloat {
    return  CGFloat(Int(viewWidth - 20) / columns - 5)
}
