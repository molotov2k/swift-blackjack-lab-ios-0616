//
//  Card.swift
//  swift-blackjack-lab
//
//  Created by Max Tkach on 7/12/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation


class Card {
    
    let suit: String
    let rank: String
    let cardLabel: String
    let cardValue: UInt
    
    var description: String {
        get { return cardLabel }
    }
    
    
    init (suit: String, rank: String) {
        self.suit = suit
        self.rank = rank
        cardLabel = "\(suit)\(rank)"
        cardValue = Card.calculateValue(rank)
    }
    
    
    private class func calculateValue(rank: String) -> UInt {
        if rank == "A" {
            return 1
        }
        let rankIntValue = UInt(rank)
        if let rankIntValue = rankIntValue {
            return rankIntValue
        } else {
            return 10
        }
    }
    
    
    class func validSuits() -> [String] {
        return [
            "♠️",
            "♣️",
            "♥️",
            "♦️",
        ]
    }
    
    
    class func validRanks() -> [String] {
        return [
            "2",
            "3",
            "4",
            "5",
            "6",
            "7",
            "8",
            "9",
            "10",
            "J",
            "Q",
            "K",
            "A",
        ]
    }
    
}