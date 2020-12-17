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
    func leaveGame()
}

extension GameViewController: MemoryGameDelegate {
    func leaveGame() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func playAgain() {
        self.resetGame()
        start()
    }
    
    func didEndGame() {
        if let chronometer = chronometer {
            chronometer.end()
            self.chronometer = nil
        }
        saveHistoric()
        presentResult()
    }
}
