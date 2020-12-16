//
//  MemoryGameDelegate.swift
//  desafio4all
//
//  Created by Lidiane Gomes Barbosa on 15/12/20.
//

import Foundation
import UIKit
protocol MemoryGameDelegate: class {
    func didEndGame()
    func playAgain()
}

extension GameViewController: MemoryGameDelegate {
    func playAgain() {
        self.updateButton(false)
        self.collectionView.isUserInteractionEnabled = false
        self.resetGame()
    }
    
    func didEndGame() {
        if let chronometer = chronometer {
            chronometer.end()
            self.chronometer = nil
        }
        presentResult()
    }
}
