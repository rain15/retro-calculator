//
//  ViewController.swift
//  retro-calculator
//
//  Created by Hema Pillay on 11/25/15.
//  Copyright © 2015 PACKSHI BIZ. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
    
    var btnSound: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        
        let soundURL = NSURL(fileURLWithPath: path!)
        
        do {
            try btnSound = AVAudioPlayer(contentsOfURL: soundURL)
            
            btnSound.prepareToPlay()
            
          
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        
        
        
        
    }

    @IBAction func numberPressed(btn: UIButton!) {
        
        btnSound.play()
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

