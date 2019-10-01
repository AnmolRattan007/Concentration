//
//  Concentration.swift
//  Concentration
//
//  Created by anmol rattan on 14/09/19.
//  Copyright © 2019 anmol rattan. All rights reserved.
//

import Foundation

struct Concentration{
   var cards =  [Card]()
   private  var indexOfOneAndOnlyFacUpCard : Int?
    
  mutating  func chooseCard(at index:Int){
        //assertion are used to crash the program if the index value is not contained in the cards array.assertion are ignored when the app is uploded to the app store
        assert(cards.indices.contains(index), "Concenteation.chooseCard at\(index):Index not dound.")
        if !cards[index].isMatched{
            
            if let matchIndex = indexOfOneAndOnlyFacUpCard , matchIndex != index{
                if cards[matchIndex] == cards[index]{
                    cards[index].isMatched = true
                    cards[matchIndex].isMatched = true
                }
                    cards[index].isFaceUp = true
                 indexOfOneAndOnlyFacUpCard = nil
                
            }else{
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFacUpCard = index
            }
            
            
        }
        
        
    }
  
    
    init(numberOfPairsOfCard:Int) {
        for _ in 1...numberOfPairsOfCard{
            let card = Card()
            cards += [card,card]
        }
    }
    
    
}
