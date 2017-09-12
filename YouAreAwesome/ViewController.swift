//
//  ViewController.swift
//  YouAreAwesome
//
//  Created by Chris Chiang on 9/4/17.
//  Copyright © 2017 Chris Chiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    var index = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func messageButtonPressed(_ sender: UIButton) {
        
        let messages = ["You are Fantastic",
                        "You Are Great!",
                        "You Are Amazing!",
                        "When the Genius Bar needs help, they call you!",
                        "You brighten My Day!",
                        "You Are Da Bomb!",
                        "I can't wait to use your app!",
                        "Fabulous? That's You!"]
        
        var newIndex = -1
        
        repeat {
            newIndex = Int(arc4random_uniform(UInt32(messages.count)))
        } while index == newIndex
        
        index = newIndex
        messageLabel.text = messages[index]
    }


}

