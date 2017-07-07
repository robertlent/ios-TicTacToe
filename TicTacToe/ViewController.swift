//
//  ViewController.swift
//  TicTacToe
//
//  Created by Robert on 7/7/17.
//  Copyright © 2017 Lent Coding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var outcomeLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    var activePlayer = 1 // X, 2 = O
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]

    let winningCombos = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [1, 4, 7], [2, 4, 6]]
    var gameIsActive = true
    
    @IBAction func pressedAction(_ sender: UIButton) {
        if gameState[sender.tag] == 0  && gameIsActive {
            gameState[sender.tag] = activePlayer
            
            if activePlayer == 1 {
                sender.setImage(UIImage.init(named: "x.png"), for: UIControlState())
                activePlayer = 2
            } else {
                sender.setImage(UIImage.init(named: "o.png"), for: UIControlState())
                activePlayer = 1
            }
        }
        
        for combo in winningCombos {
            if gameState[combo[0]] != 0 && gameState[combo[0]] == gameState[combo[1]] && gameState[combo[1]] == gameState[combo[2]] {
                gameIsActive = false
                
                if gameState[combo[0]] == 1 {
                    outcomeLabel.text = "X has won!"
                } else {
                    outcomeLabel.text = "O has won!"
                }
                
                playAgainButton.isHidden = false
                outcomeLabel.isHidden = false
                
                for case let button as UIButton in self.view.subviews {
                    button.isEnabled = false
                    playAgainButton.isEnabled = true
                }
            }
        }
        
        gameIsActive = false
        
        for i in gameState {
            if i == 0 {
                gameIsActive = true
                break
            }
        }
        
        if gameIsActive == false {
            outcomeLabel.text = "Draw!"
            outcomeLabel.isHidden = false
            playAgainButton.isHidden = false
        }
    }
    
    @IBAction func pressedPlayAgain(_ sender: UIButton) {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
        
        playAgainButton.isHidden = true
        outcomeLabel.isHidden = true
        
        for case let button as UIButton in self.view.subviews {
            button.setImage(nil, for: UIControlState())
            button.isEnabled = true
        }
    }
}

