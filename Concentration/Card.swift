//
//  Card.swift
//  Concentration
//
//  Created by anmol rattan on 14/09/19.
//  Copyright © 2019 anmol rattan. All rights reserved.
//

import Foundation

struct Card:Hashable{

    var isFaceUp = false
    var isMatched = false
   private var identifier:Int
   
    
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier 
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
       
    }
  
    private  static var uniqueIdentifier = 0
    private  static func getUniqueIdentifier()->Int{
        uniqueIdentifier += 1
        return uniqueIdentifier
    }
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
