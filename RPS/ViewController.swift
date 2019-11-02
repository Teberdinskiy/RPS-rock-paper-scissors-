//
//  ViewController.swift
//  RPS
//
//  Created by Алихан Батчаев on 01.11.2019.
//  Copyright © 2019 Alikhan Batchaev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var computerLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var rockLabel: UIButton!
    @IBOutlet var scissorsLabel: UIButton!
    @IBOutlet var paperLabel: UIButton!
    @IBOutlet var playLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetBoard()
    }
    
    func resetBoard() {
        computerLabel.text = "🦄"
        statusLabel.text = "Rock, Paper, Scissors?"
        rockLabel.isHidden = false
        rockLabel.isEnabled = true
        paperLabel.isHidden = false
        paperLabel.isEnabled = true
        scissorsLabel.isHidden = false
        scissorsLabel.isEnabled = true
        playLabel.isHidden = true
    }
    
    func play(_ playerTurn: Sign) {
        rockLabel.isEnabled = false
        paperLabel.isEnabled = false
        scissorsLabel.isEnabled = false
        
        let opponent = randomSign()
        computerLabel.text = opponent.emoji
        
        let gameResult = playerTurn.takeTurn(opponent)
        
        switch gameResult {
        case .draw:
            statusLabel.text = "it's a draw"
        case .lose:
            statusLabel.text = "sorry, you lose"
        case .win:
            statusLabel.text = "You win!"
        case .start:
            statusLabel.text = "Rock, Paper, Scissors?"
        }
        
        switch playerTurn {
        case .rock:
            rockLabel.isHidden = false
            paperLabel.isHidden = true
            scissorsLabel.isHidden = true
        case .paper:
            rockLabel.isHidden = true
            paperLabel.isHidden = false
            scissorsLabel.isHidden = true
        case .scissors:
            rockLabel.isHidden = true
            paperLabel.isHidden = true
            scissorsLabel.isHidden = false
        }
        
        playLabel.isHidden = false
        
    }
    
    @IBAction func rockButton(_ sender: UIButton) {
        play(Sign.rock)
    }
    @IBAction func paperButton(_ sender: UIButton) {
        play(Sign.paper)
    }
    @IBAction func scissorsButton(_ sender: UIButton) {
        play(Sign.scissors)
    }
    @IBAction func playButton(_ sender: UIButton) {
        resetBoard()
    }
    
}

