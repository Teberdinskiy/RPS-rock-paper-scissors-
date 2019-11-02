//
//  Sign.swift
//  RPS
//
//  Created by Алихан Батчаев on 01.11.2019.
//  Copyright © 2019 Alikhan Batchaev. All rights reserved.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1{
        return .paper
    } else {
        return .scissors
    }
}

enum Sign {
    case rock, scissors, paper
    
    var emoji: String {
        switch self {
        case .paper:
            return  "✋🏻"
        case .rock:
            return  "👊🏻"
        case .scissors:
            return  "✌🏻"
        }
    }
    
    
    func takeTurn(_ opponent: Sign) -> GameState {
        switch (self, opponent) {
        case (.rock, .rock),
             (.paper, .paper),
             (.scissors, .scissors):
            return .draw
        case (.rock, .scissors),
             (.paper, .rock),
             (.scissors, .paper):
            return .win
        default:
            return .lose
        }
    }
}


