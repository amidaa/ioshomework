//
//  ViewController.swift
//  Taskseven
//
//  Created by student on 2018/11/29.
//  Copyright © 2018年 201611451. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var scoreLable: UILabel!
    
    @IBOutlet weak var scordlable: UILabel!
    lazy var game = Concentration(numberOfPairsOfCards:(cardButtons.count+1)/2)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

  
   
    @IBAction func cardTouch(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of:sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else{
            print("choose card was not in cardButtons")
        }
    }
    
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for:UIControl.State.normal)
//                print("isfa")
                button.backgroundColor = card.isMatched ?  _ColorLiteralType(red: 1, green: 1, blue: 1, alpha: 0) :  _ColorLiteralType(red: 0, green: 1, blue: 0.1318072379, alpha: 1)
            }
        }
                scoreLable.text = "score: \(game.score)"
    }
    var emojiChoices = ["⚽️","🏀","🏈","⚾️","🎱","🏉","🏐","🎾","🏓","🏸","🏒"]
    
    var emoji = [Int: String]()
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    
  
   
        @IBAction func newGame(_ sender: Any) {
            game = Concentration(numberOfPairsOfCards: (cardButtons.count+1)/2)
            updateViewFromModel()
        }
    
    
    
}

