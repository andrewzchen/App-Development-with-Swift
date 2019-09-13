//
//  ViewController.swift
//  Apple Pie
//
//  Created by Andrew Chen on 6/25/19.
//  Copyright © 2019 Andrew Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var listOfWords = ["Nuggets", "Lakers", "Raptors", "Sixers", "Rockets", "Bucks"]
   // var listOfWords = ["abc"]
    let incorrectMovesAllowed = 7
    
    var totalWins = 0 {
        didSet{
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet{
            newRound()
        }
    }
    var currentGame: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        // Do any additional setup after loading the view.
    }
    // start a new game
    func newRound() {
        // take first word: potentially change to random
        if (listOfWords.isEmpty) {
            updateUI()
            enableButtons(false)
            return
        }
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
        enableButtons(true)
        updateUI()
    }
    
    // reactivate letter buttons
    func enableButtons(_ value: Bool) {
        for button in letterButtons {
            button.isEnabled = value
        }
    }
    
    func updateUI() {
        // space out the underscores
        var letterString = [String]()
        for letter in currentGame.currentWord {
            letterString.append(String(letter))
        }
        let spacedWord = letterString.joined(separator: " ")
        
        correctWordLabel.text = "\(spacedWord)"
        scoreLabel.text = "Wins: \(totalWins), Losses: :\(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
    
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var correctWordLabel: UILabel!
    @IBOutlet var treeImageView: UIImageView!
    @IBOutlet var letterButtons: [UIButton]!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let buttonLetter = Character(letterString.lowercased())
        currentGame.makeGuess(c: buttonLetter)
        updateGameState()
    }
    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        }
        else if currentGame.currentWord == currentGame.word {
            totalWins += 1
        }
        else {
            updateUI()
        }
    }
}

