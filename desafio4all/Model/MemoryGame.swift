//
//  MemoryGame.swift
//  desafio4all
//
//  Created by Lidiane Gomes Barbosa on 14/12/20.
//

import Foundation
class MemoryGame {
    var cards = [Card]()
    var cardsShown = [Card]()
    var isPlaying: Bool = false
    weak var delegate: MemoryGameDelegate?
    
    func newGame(totalCards: Int) -> [Card] {
        self.cards = generateshuffleCards(totalCards: totalCards)
        self.isPlaying = true
        return cards
    }
    
    func restartGame() {
        cardsShown.forEach { (card) in
            card.isShown = false
        }
        self.isPlaying = false
        self.cards.removeAll()
        self.cardsShown.removeAll()
    }
    
    func isPossibleComparation() -> Bool {
        return cardsShown.count % 2 != 0
    }
    
    func lastCardPressed() -> Card? {
        return cardsShown.last
    }
    
    func didSelectCard(card: Card?) {
        guard let card = card else { return }
        card.isShown = true
        
        if isPossibleComparation() {
            let lastCard = lastCardPressed()!
            
            if card.isEqual(lastCard) {
                cardsShown.append(card)
                card.delegate?.success()
                lastCard.delegate?.success()
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    card.isShown = false
                    lastCard.isShown = false
                }
                cardsShown.removeLast()
            }
        } else {
            cardsShown.append(card)
        }
        
        if cardsShown.count == cards.count {
            endGame()
        }
        
    }
    
    func endGame() {
        delegate?.didEndGame()
    }
    
    private func generateshuffleCards(totalCards: Int) -> [Card] {
        var newCards = [Card]()
        let sequence = generateSequence(totalCards: totalCards)
        sequence.forEach { value in
            let card = Card(id: value)
            newCards.append(card)
        }
        return newCards
    }
    
    
    private func generateSequence(totalCards: Int) -> [Int] {
        var sequence: [Int] = []
        let totalNumbers = totalCards / 2
        sequence.append(contentsOf: 1...totalNumbers)
        sequence.append(contentsOf: 1...totalNumbers)
        
        return sequence.shuffled()
    }
}
