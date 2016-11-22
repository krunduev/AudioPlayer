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
    
    @IBOutlet weak var slider: UISlider!
    
    @IBAction func playPressed(_ sender: Any) {
        player.play()
    }
    
    @IBAction func pausePressed(_ sender: Any) {
        player.pause()
    }
    
    @IBAction func sliderMoved(_ sender: Any) {
        player.volume = slider.value
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let audioPath = Bundle.main.path(forResource: "007", ofType: "mp3")
        
        do {
            
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
        } catch {
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

