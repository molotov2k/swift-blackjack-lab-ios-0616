//
//  Player.swift
//  swift-blackjack-lab
//
//  Created by Max Tkach on 7/12/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation


class Player {
    
    let name: String
    
    var cards: [Card]
    var stayed: Bool
    var tokens: UInt
    
    var description: String {
        get { return GetDescription() }
    }
    
    var handscore: UInt {
        get { return calculateHandScore() }
    }
    
    var blackjack: Bool {
        get {
            if handscore == 21 {
                return true
            } else {
                return false
            }
        }
    }
    
    var busted: Bool {
        get {
            if handscore > 21 {
                return true
            } else {
                return false
            }
        }
    }
    
    var mayHit: Bool {
        get {
            if !busted && !blackjack && !stayed {
                return true
            } else {
                return false
            }
        }
    }
    
    
    init(name: String) {
        self.name = name
        cards = []
        stayed = false
        tokens = 100
    }
    
    
    private func calculateHandScore() -> UInt {
        var score: UInt = 0
        var aceInHand = false
        
        for card in cards {
            score += card.cardValue
            if card.cardValue == 1 {
                aceInHand = true
            }
        }
        if score < 12 && aceInHand {
            score += 10
        }
        
        return score
    }
    
    
    func canPlaceBet(bet: UInt) -> Bool {
        if bet <= tokens {
            return true
        } else {
            return false
        }
    }
    
    
    func didWin(amount: UInt) {
        tokens += amount
    }
    
    
    func didLose(amount: UInt) {
        tokens -= amount
    }
    
    
    private func GetDescription() -> String {
        return "Player name: \(name)\nCards in hand: \(cards)\nHandscore: \(handscore)\nBlackjack: \(blackjack)\nBusted: \(busted)\nStayed: \(stayed)\nTokens: \(tokens)"
    }
    
    
}
