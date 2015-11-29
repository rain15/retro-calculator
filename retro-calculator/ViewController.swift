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

    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Equals = "="
        case Empty = "Empty"
    }
    
    @IBOutlet weak var outputLabel: UILabel!
    
    var currentOperation:Operation = Operation.Empty
    
    var btnSound: AVAudioPlayer!
    
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    
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
        
        outputLabel.text = "0"
        
        
        
    }

    @IBAction func numberPressed(btn: UIButton!) {
        
        playSound()
        
        runningNumber += "\(btn.tag)"
        
        outputLabel.text = runningNumber
        
    }
    
    
    @IBAction func onDividePressed(sender: AnyObject) {
        print("DIVIDE OPERATION")
        processOperation(Operation.Divide)
    }

    
    @IBAction func onMultiplyPressed(sender: AnyObject) {
        processOperation(Operation.Multiply)

    }

    
    @IBAction func onSubtractPressed(sender: AnyObject) {
        processOperation(Operation.Subtract)

    }
    
    
    @IBAction func onAddPressed(sender: AnyObject) {
        processOperation(Operation.Add  )

    }
    
    
    @IBAction func onEqualPressed(sender: AnyObject) {
        processOperation(Operation.Equals)

    }
    
    func processOperation(op: Operation) {
        
        if currentOperation != Operation.Empty {
                //do some math
        }
        else {
            //first time
            print("Operation is empty - first time")
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = op
        }
        
    }
    
    func playSound() {
        
        if btnSound.playing {
            btnSound.stop()
        }
        
        btnSound.play()
    }
    
}

