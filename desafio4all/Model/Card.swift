//
//  Card.swift
//  desafio4all
//
//  Created by Lidiane Gomes Barbosa on 13/12/20.
//

import Foundation
struct Card {
    let id: Int
    let indexPath: IndexPath
    var isSelected: Bool = false
    var isComplete: Bool = false
    
    func isEqual(_ card: Card) -> Bool {
        self.id == card.id
    }
}
