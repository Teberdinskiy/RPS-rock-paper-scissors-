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
    
    var currentGameState = GameState.start
    
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
        self.view.backgroundColor = UIColor.white
    }
    
    func play(_ playerTurn: Sign) {
        rockLabel.isEnabled = false
        paperLabel.isEnabled = false
        scissorsLabel.isEnabled = false
        
        let opponent = randomSign()
        computerLabel.text = opponent.emoji
        
        currentGameState = playerTurn.takeTurn(opponent)
        
        switch currentGameState {
        case .draw:
            statusLabel.text = "it's a draw"
        case .lose:
            statusLabel.text = "sorry, you lose"
            self.view.backgroundColor = UIColor.red
        case .win:
            statusLabel.text = "You win!"
            self.view.backgroundColor = UIColor.green
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

