//
//  Card.swift
//  desafio4all
//
//  Created by Lidiane Gomes Barbosa on 13/12/20.
//

import Foundation
import UIKit
class Card {
    let id: Int
    weak var delegate: GameCellDelegate?
    var isShown: Bool = false {
        didSet {
            delegate?.animateCard(isShown)
        }
    }
    
    init(id: Int) {
        self.id = id
        self.isShown = false
    }
    
    func isEqual(_ card: Card) -> Bool {
        self.id == card.id
    }
}
