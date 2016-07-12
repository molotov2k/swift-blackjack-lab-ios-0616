//
//  House.swift
//  swift-blackjack-lab
//
//  Created by Max Tkach on 7/12/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation


class House: Player {
    
    var wallet: UInt
    
    var mustHit: Bool {
        get {
            if handscore < 17 {
                return true
            } else {
                return false
            }
        }
    }
    
    
    override init(name: String) {
        wallet = 1000
        super.init(name: name)
        super.tokens = wallet
    }
    
    
}