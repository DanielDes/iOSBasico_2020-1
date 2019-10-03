//
//  Emoji.swift
//  Emoji_Dictionary
//
//  Created by L Daniel De San Pedro on 9/30/19.
//  Copyright © 2019 L Daniel De San Pedro. All rights reserved.
//

import Foundation

class Emoji{
    
    var symbol: String
    var name: String
    var usage: String
    var description: String
    
    init(symbol:String, name: String, usage: String, description: String) {
        self.symbol = symbol
        self.name = name
        self.usage = usage
        self.description = description
    }
    
}
