//
//  GameVC.swift
//  QuizMe
//
//  Created by Dulio Denis on 3/18/16.
//  Copyright © 2016 Dulio Denis. All rights reserved.
//

import UIKit
import pop

class GameVC: UIViewController {

    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    var currentCard: Card!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentCard = createCardFromNib()
        currentCard.center = AnimationEngine.screenCenterPosition
        view.addSubview(currentCard)
    }
    
    
    @IBAction func yesTapped(sender: UIButton) {
        if sender.titleLabel?.text == "YES" {
            checkAnswer()
        } else {
            // just starting the game
            titleLabel.text = "Does this card match the last one?"
        }
        showNextCard()
     }
    
    
    @IBAction func noTapped(sender: UIButton) {
        checkAnswer()
        showNextCard()
    }
    
    
    func showNextCard() {
        if let current = currentCard {
            let cardToRemove = current
            currentCard = nil
            
            AnimationEngine.animateToPosition(cardToRemove, position: AnimationEngine.offScreenLeftPosition, completion: { (animation: POPAnimation!, finished: Bool) -> Void in
                cardToRemove.removeFromSuperview()
            })
        }
        
        if let next = createCardFromNib() {
            next.center = AnimationEngine.offScreenRightPosition
            view.addSubview(next)
            currentCard = next
            
            if noButton.hidden {
                noButton.hidden = false
                yesButton.setTitle("YES", forState: .Normal)
            }
            
            AnimationEngine.animateToPosition(next, position: AnimationEngine.screenCenterPosition, completion: { (animation: POPAnimation!, finished: Bool) -> Void in
                
            })
        }
    }
    
    
    func createCardFromNib() -> Card? {
        return NSBundle.mainBundle().loadNibNamed("Card", owner: self, options: nil)[0] as? Card
    }
    
    
    func checkAnswer() {
        
    }
    
}
