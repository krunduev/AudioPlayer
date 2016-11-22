//
//  ViewController.swift
//  Audio Player
//
//  Created by Kostyantyn Runduyev on 11/22/16.
//  Copyright © 2016 Kostyantyn Runduyev. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player = AVAudioPlayer()
    let audioPath = Bundle.main.path(forResource: "007", ofType: "mp3")
    var timer = Timer()
    
    @IBOutlet weak var scrubber: UISlider!
    @IBOutlet weak var slider: UISlider!
    
    func updateScrubber() {
        
        scrubber.value = Float(player.currentTime)
    
    }
    
    @IBAction func playPressed(_ sender: Any) {
        player.play()
        timer = Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(ViewController.updateScrubber), userInfo: nil, repeats: true)
    }
    
    @IBAction func pausePressed(_ sender: Any) {
        player.pause()
        timer.invalidate()
    }
    
    @IBAction func stopPressed(_ sender: Any) {
       
        timer.invalidate()
        scrubber.value = 0

        player.stop()
        
        do {
            
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
        } catch {
            
        }
    }
    
    @IBAction func sliderMoved(_ sender: Any) {
        player.volume = slider.value
    }
        
    @IBAction func scrubberMoved(_ sender: Any) {
        player.currentTime = TimeInterval(scrubber.value)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do {
            
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
            scrubber.maximumValue = Float(player.duration)
            
        } catch {
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

