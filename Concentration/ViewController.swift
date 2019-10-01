//
//  ViewController.swift
//  Concentration
//
//  Created by anmol rattan on 13/09/19.
//  Copyright © 2019 anmol rattan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 private lazy var game = Concentration(numberOfPairsOfCard: numberOfPairsOfCards)
  private(set)  var flipCount = 0{
        didSet{
           updateFlipCountLabel()
        }
    }
    
    var numberOfPairsOfCards:Int {
        return (cardButtons.count+1)/2
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    
    
    @IBOutlet weak var flipCountLabel: UILabel! {
        didSet{
            updateFlipCountLabel()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(cardButtons.count)
        game.cards.shuffle()
    }
    @IBAction func cardButtonPressed(_ sender: UIButton) {
        flipCount += 1
        let cardIndex = cardButtons.firstIndex(of: sender)!
        game.chooseCard(at: cardIndex)
        updateViewFromModel()
        
        
    }
    
    private func updateFlipCountLabel(){
        let attributes:[NSAttributedString.Key:Any] = [.strokeWidth:5.0,.strokeColor: #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)]
        let attributedString = NSAttributedString(string: "Flip Count: \(flipCount)", attributes: attributes)
        flipCountLabel.attributedText = attributedString
        
    }
    
  private  func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }else{
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
            
        }
        
        
    }
  private  var cardEmojiArray = ["👻","👹","👻","💩","🙀","👿","🍭","🍎"]
  private  var emoji = [Card:String]()
   private func emoji(for card:Card)-> String{
        if emoji[card] == nil , cardEmojiArray.count > 0 {
           
            emoji[card] = cardEmojiArray.remove(at: cardEmojiArray.count.arc4random)
        }
        return emoji[card] ?? "?"
       
    }



}

extension Int{
    
    var arc4random:Int{
        if self>0{
            return Int(arc4random_uniform(UInt32(self)))
            
        }else if self<0{
             return -Int(arc4random_uniform(UInt32(abs(self))))
        }else{
            return 0
        }
    }
}
