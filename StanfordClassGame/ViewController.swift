//
//  ViewController.swift
//  StanfordClassGame
//
//  Created by Lucas Moraes on 05/12/2017.
//  Copyright © 2017 LSolutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var cardButtons: [UIButton]!
    @IBOutlet weak private var flipCountLabel: UILabel!
    
    private lazy var game = Concentration(numberOfPairOfCards: numberOfPairOfCards)
    
    var numberOfPairOfCards: Int {
        return cardButtons.count + 1 / 2
    }
    
    private(set) var flipCount: Int = 0 { didSet { self.flipCountLabel.text = "Flips: \(flipCount)" } }
    
    override func viewDidLoad() {super.viewDidLoad()}

    @IBAction private func flipFunc(_ sender: UIButton) {
        let cardNumber = cardButtons.index(of: sender)!
        game.chooseCard(at: cardNumber)
        updateViewFromModel()
        flipCount += 1
    }
    
    private func updateViewFromModel() {
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
    
    private var emojiChoices = ["👻","☠️","👾","🧟‍♂️","🌝","🔞","📱","🎮"]
    private var emoji = [Int:String]() // Dictionary
    
    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil , emojiChoices.count > 0 {
                emoji[card.identifier] = emojiChoices.remove(at: emojiChoices.count.arc4random)
            }
        return emoji[card.identifier] ?? "?"
    }
    
    
    
    
}



extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self))) // self = .variable
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}


































