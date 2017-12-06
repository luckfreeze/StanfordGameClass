//
//  ViewController.swift
//  StanfordClassGame
//
//  Created by Lucas Moraes on 05/12/2017.
//  Copyright © 2017 LSolutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipCountLabel: UILabel!
    
    lazy var game = Concentration(numberOfPairOfCards: (cardButtons.count + 1) / 2)
    
    var flipCount: Int = 0 {didSet {self.flipCountLabel.text = "Flips: \(flipCount)"}}
    
    
    override func viewDidLoad() {super.viewDidLoad()}

    @IBAction func flipFunc(_ sender: UIButton) {
        let cardNumber = cardButtons.index(of: sender)!
        game.chooseCard(at: cardNumber)
        updateViewFromModel()
        flipCount += 1
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = UIColor.white
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? UIColor.clear : UIColor.orange
            }
        }
    }
    
    var emojiChoices = ["👻","☠️","👾","🧟‍♂️","🌝","🔞","📱","🎮"]
    var emoji = [Int:String]() // Dictionary
    
    func emoji(for card: Card) -> String {

        if emoji[card.identifier] == nil , emojiChoices.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            }
            
        
        
        return emoji[card.identifier] ?? "?"
    }

}















