//
//  ViewController.swift
//  Blackjack
//
//  Created by George Cochrane on 14/04/2024.
//

import UIKit

class ViewController: UIViewController {
    
    var myDeck: [String] = []

    
    @IBOutlet weak var imgCard1: UIImageView!
    
    @IBOutlet weak var imgCard2: UIImageView!
    
    @IBAction func btnDeal(_ sender: Any) {
        imgCard1.image = UIImage(named: randomCard(deck: myDeck))
        imgCard2.image = UIImage(named: randomCard(deck: myDeck))
    }

    func randomCard(deck: [String]) -> String{
        
        let maxRange = deck.count - 1
        let randomNum = Int.random(in: 0...maxRange)
        return deck[randomNum]
    }
    
    func createDeck() -> [String]{
        let suits = ["Hearts", "Diamonds", "Clubs", "Spades"]
        
        var blankDeck: [String] = []
        
        for suit in suits{
            for rank in 1...13 {
                if rank < 10{
                    let newCard = suit + "0" + String(rank)
                    blankDeck.append(newCard)
                } else {
                    let newCard = suit + String(rank)
                    blankDeck.append(newCard)
                }
            }
        }
        return blankDeck
        
    }
    
    var deck: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myDeck = createDeck()
            
    }
}

