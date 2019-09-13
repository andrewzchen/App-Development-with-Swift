//
//  Emoji.swift
//  Emoji Dictionary
//
//  Created by Andrew Chen on 7/12/19.
//  Copyright © 2019 Andrew Chen. All rights reserved.
//

import Foundation



struct Emoji {
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    init(symbol: String, name: String, description: String, usage: String) {
        self.symbol = symbol
        self.name = name
        self.description = description
        self.usage = usage
    }
}
