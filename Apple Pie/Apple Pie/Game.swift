//
//  Game.swift
//  Apple Pie
//
//  Created by Andrew Chen on 6/28/19.
//  Copyright © 2019 Andrew Chen. All rights reserved.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    var currentWord : String {
        var temp = ""
        for letter in word {
            if guessedLetters.contains(Character(letter.lowercased())) {
                temp.append(letter)
            }
            else {
                temp.append("-")
            }
        }
        return temp
    }
    // mutating necessary because member variables are modified
    mutating func makeGuess(c: Character) {
        guessedLetters.append(c)
        if word.lowercased().contains(c) {
        }
        else {
            incorrectMovesRemaining -= 1
        }
    }
    
}
