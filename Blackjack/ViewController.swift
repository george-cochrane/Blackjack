//
//  ViewController.swift
//  Blackjack
//
//  Created by George Cochrane on 14/04/2024.
//

import UIKit

class ViewController: UIViewController {
    
    var myDeck: [String] = []
    var dealerCount = 0
    var playerCount = 0
    var turn = true
    
    @IBOutlet weak var imgCard1: UIImageView!
    @IBOutlet weak var imgCard2: UIImageView!
    
    @IBAction func btnDeal(_ sender: Any) {
      
        createCard()
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
    
    func createCard(){
        let cardView = UIImageView()
        
        if turn == true && dealerCount < 5{
            
            cardView.frame = CGRect(x: 5 + (dealerCount * 50), y: 100, width: 83, height: 121)
            cardView.image = UIImage(named: myDeck.removeLast())
            
            dealerCount += 1
            turn = false
            
        } else if turn == false && playerCount < 5{
            cardView.frame = CGRect(x: 5 + (playerCount * 50), y: 300, width: 83, height: 121)
            cardView.image = UIImage(named: myDeck.removeLast())
            playerCount += 1
            turn = true
            
        } else {
            print("No more cards being dealt")
        }
        view.addSubview(cardView)
    }
    
    var deck: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myDeck = createDeck()
        myDeck.shuffle()
    }
}
