//
//  ViewController.swift
//  Blackjack
//
//  Created by George Cochrane on 14/04/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgCar2: UIImageView!
    
    @IBOutlet weak var imgCard1: UIImageView!
    
    @IBAction func btnDeal(_ sender: Any) {
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
        
        deck = createDeck()
              
        
    }
}
