//
//  ViewController.swift
//  QuizMe
//
//  Created by Dulio Denis on 3/15/16.
//  Copyright © 2016 Dulio Denis. All rights reserved.
//

import UIKit
import pop

class LoginVC: UIViewController {
    // IBOutlets to Constraints
    @IBOutlet weak var emailConstraint: NSLayoutConstraint!
    @IBOutlet weak var passwordConstraint: NSLayoutConstraint!
    @IBOutlet weak var loginConstraint: NSLayoutConstraint!
    
    var animationEngine: AnimationEngine!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationEngine = AnimationEngine(constraints: [emailConstraint, passwordConstraint, loginConstraint])
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        animationEngine.animateOnScreen(1)
    }
}

