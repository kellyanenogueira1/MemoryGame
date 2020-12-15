//
//  ChronometerDelegate.swift
//  desafio4all
//
//  Created by Lidiane Gomes Barbosa on 15/12/20.
//

import Foundation
import UIKit

protocol ChronometerDelegate: class {
    func didUpdate()
}
extension GameViewController: ChronometerDelegate {
    func didUpdate() {
        self.labelTime.text = chronometer?.time
    }
}
