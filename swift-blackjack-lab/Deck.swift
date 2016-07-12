//
//  Deck.swift
//  swift-blackjack-lab
//
//  Created by Max Tkach on 7/12/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation


class Deck {
    
    private var remainingCards: [Card] = []
    private var dealtCards: [Card] = []
    
    var description: String {
        get { return getDescription() }
    }
    
    
    init () {
        let validRanks = Card.validRanks()
        let validSuits = Card.validSuits()
        
        for rank in validRanks {
            for suit in validSuits {
                let card = Card.init(suit: suit, rank: rank)
                remainingCards.append(card)
            }
        }
    }
    
    
    private func getDescription() -> String {
        return "Cards remaining: \(remainingCards.count)\nCards dealt: \(dealtCards.count)"
    }
    
    
    private func resetDeck() {
        remainingCards.appendContentsOf(dealtCards)
        dealtCards.removeAll()
    }
    
    
    func shuffle() {
        resetDeck()
        var shuffledDeck: [Card] = []
        while remainingCards.count > 0 {
            let index = Int(arc4random_uniform(UInt32(remainingCards.count)))
            let card = remainingCards.removeAtIndex(index)
            shuffledDeck.append(card)
        }
        remainingCards = shuffledDeck
    }
    
    
    func drawCard() -> Card {
        let card = remainingCards.removeLast()
        dealtCards.append(card)
        return card
    }
    
    
}