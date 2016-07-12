//
//  AppDelegate.swift
//  swift-blackjack-lab
//
//  Created by Flatiron School on 7/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    let dealer = Dealer()
    var playersTurn = true
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        playBlackjack()
        return true
    }
    
    func playBlackjack() {
        
        while true {
            playersTurn = true
            dealer.deal()
            
            if dealer.placeBet(300) {
                dealer.bet = 300
            } else {
                if dealer.player.tokens < 300 {
                    print("HOUSE WINS THE GAME")
                    print(dealer.house.description)
                    return
                } else {
                    print("PLAYER WINS THE GAME")
                    print(dealer.player.description)
                    return
                }
            }
            
            while true {
                if playersTurn {
                    dealer.turn(dealer.player)
                    let winner = dealer.award()
                    if winner.characters.count > 15 {
                        print("House handscore: \(dealer.house.handscore)\nPlayer handscore: \(dealer.player.handscore)")
                        break
                    }
                    playersTurn = false
                } else {
                    dealer.turn(dealer.house)
                    let winner = dealer.award()
                    if winner.characters.count > 15 {
                        print("House handscore: \(dealer.house.handscore)\nPlayer handscore: \(dealer.player.handscore)")
                        break
                    }
                    playersTurn = true
                }
            }
        }
        
    }
    
}

