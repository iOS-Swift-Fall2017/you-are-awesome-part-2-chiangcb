//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Chris Chiang on 8/29/17.
//  Copyright © 2017 chiang. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var awesomeImage: UIImageView!
    @IBOutlet weak var soundSwitch: UISwitch!
    var awesomePlayer = AVAudioPlayer()
    var index = -1
    var imageNumber = -1
    var soundNumber = -1
    let numberOfImages = 10
    let numberOfSongs = 6
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
        if let sound = NSDataAsset(name: soundName) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            }
            catch {
                print("ERROR: data in \(soundName) couldn't be played as a sound.")
            }
        }
        else {
            print("ERROR: data in \(soundName) couldn't be played as a sound.")
        }
    }
    
    func nonRepeatingRandom(lastNumber: Int, maxValue: Int) -> Int {
        var newIndex = -1
        repeat {
            newIndex = Int(arc4random_uniform(UInt32(maxValue)))
        } while lastNumber == newIndex
        return newIndex //return new Index
    }
    
    @IBAction func soundSwitchPressed(_ sender: UISwitch) {
        if !soundSwitch.isOn && (soundNumber != -1) {
            awesomePlayer.stop()
            //asd
        }
    }
    
    @IBAction func messageButtonPressed(_ sender: UIButton) {
        let messages = ["You Are Fantastic",
                        "You Are Great!",
                        "You Are Amazing!",
                        "When the Genius Bar needs help, they call you!",
                        "You Brighten My Day!",
                        "You Are Da Bomb!",
                        "I can't wait to use your app!",
                        "Fabulous? That's You!"]
        index = nonRepeatingRandom(lastNumber: index, maxValue: messages.count)
        messageLabel.text = messages[index]
        
        awesomeImage.isHidden = false
        imageNumber = nonRepeatingRandom(lastNumber: imageNumber, maxValue: numberOfImages)
        awesomeImage.image = UIImage(named: "image\(imageNumber)")
        
        if soundSwitch.isOn {
            soundNumber = nonRepeatingRandom(lastNumber: soundNumber, maxValue: numberOfSongs)
            let soundName = "sound\(soundNumber)"
            playSound(soundName: soundName, audioPlayer: &awesomePlayer)
        }
    }
    
}
