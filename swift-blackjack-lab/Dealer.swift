//
//  Dealer.swift
//  swift-blackjack-lab
//
//  Created by Max Tkach on 7/12/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation


class Dealer {
    
    let deck = Deck()
    let house = House(name: "house")
    let player = House(name: "player")
    var bet: UInt = 0
    
    
    func placeBet(amount: UInt) -> Bool {
        if house.canPlaceBet(amount) && player.canPlaceBet(amount) {
            bet = amount
            return true
        } else {
            return false
        }
    }
    
    
    func deal() {
        deck.shuffle()
        prepareForNewRound(player)
        prepareForNewRound(house)
    }
    
    
    func prepareForNewRound(player: House) {
        player.cards.removeAll()
        player.stayed = false
        player.cards.append(deck.drawCard())
        player.cards.append(deck.drawCard())
    }
    
    
    func turn(player: House) {
        if player.mayHit && player.mustHit {
            player.cards.append(deck.drawCard())
        } else if player.mayHit && !player.mustHit {
            player.stayed = true
        }
    }
    
    
    func winner() -> String {
        if player.busted || house.blackjack {
            return house.name
        } else if house.busted || player.blackjack {
            return player.name
        }
        
        if player.cards.count == 5 {
            return player.name
        }
        
        if player.stayed && house.stayed {
            if player.handscore > house.handscore {
                return player.name
            } else {
                return house.name
            }
        } else {
            return "no"
        }
        
    }
    
    
    func award() -> String {
        let winnerName = winner()
        
        switch winnerName {
        
        case "no":
            print("No winner yet!")
            return "No winner yet!"
            
        case player.name:
            player.tokens += bet
            house.tokens -= bet
            print("\(player.name) wins!\nAmount won:\(bet)")
            return "\(player.name) wins!\nAmount won:\(bet)"
            
        case house.name:
            player.tokens -= bet
            house.tokens += bet
            print("\(house.name) wins!\nAmount won:\(bet)")
            return "\(house.name) wins!\nAmount won:\(bet)"
            
        default:
            print("Check your code. Something is wrong!")
            return "ERROR"
        
        }
    }
    
    
}