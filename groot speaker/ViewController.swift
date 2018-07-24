//
//  ViewController.swift
//  demo3
//
//  Created by Jack Huang on 2018/7/19.
//  Copyright © 2018 Jack Huang. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    @IBAction func buttonPressed(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func buttonPressed1(_ sender: Any) {
        view.endEditing(true)
    }
    var myPlayer:AVAudioPlayer?
    
    @IBAction func playSound(_ sender: UIButton) {
        myPlayer?.stop()
        myPlayer?.currentTime = 0.0
        myPlayer?.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let Path = Bundle.main.path(forResource: "iamgroot", ofType: "mp3"){
            do {
                myPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: Path))
            } catch {
                myPlayer = nil
            }
            
        }
        
    }
    
    @IBOutlet weak var lovetextfield: UITextField!
    @IBAction func speak(_ sender: UIButton) {
        
        let speechUtterance = AVSpeechUtterance(string: lovetextfield.text! )
        
        speechUtterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(speechUtterance)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
