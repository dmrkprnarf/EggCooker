//
//  ViewController.swift
//  EggCooker
//
//  Created by Arif Demirkoparan on 13.01.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var eggArray = ["Soft":240,"Medium":360,"Hard":480]
    var totalTime = 0
    var secondTime = 0
    var timer: Timer?
    var player:AVAudioPlayer!
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        timer?.invalidate()
        let hardness =  sender.titleLabel?.text
        totalTime =  eggArray[hardness!]!
        secondTime = 0
        progressBar.progress = 0.0
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
            if self.secondTime < self.totalTime {
                self.secondTime += 1
                print("\(self.secondTime) second.")
                self.progressBar.progress = Float(self.secondTime) / Float(self.totalTime)
                
            }else {
                self.titleLabel.text = "Bitti"
                guard let path = Bundle.main.path(forResource: "alarm_sound", ofType:"mp3") else {
                    return
                }
                let url = URL(fileURLWithPath: path)
                
                do {
                    self.player = try AVAudioPlayer(contentsOf: url)
                    self.player?.play()
                    
                } catch let error {
                    print(error.localizedDescription)
                }
            }})
    }
}







