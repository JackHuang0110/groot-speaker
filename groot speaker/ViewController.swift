//
//  ViewController.swift
//  groot speaker
//
//  Created by Jack Huang on 2018/7/23.
//  Copyright © 2018 Jack Huang. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var lovetextfield: UITextField!
    @IBAction func speak(_ sender: UIButton) {
        let speechUtterance = AVSpeechUtterance(string: lovetextfield.text! )
        
        speechUtterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(speechUtterance)
    }
    
    var myPlayer:AVAudioPlayer?
    @IBAction func playSound(_ sender: UIButton) {
        myPlayer?.stop()
        myPlayer?.currentTime = 0.0
        myPlayer?.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let Path = Bundle.main.path(forResource: "iamgroot/Users/jackhuang/Desktop/iamgroot.m4a", ofType: "m4a"){
            do {
                myPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: Path))
            } catch {
                myPlayer = nil
            }
            
        }
        
    }
    
}

