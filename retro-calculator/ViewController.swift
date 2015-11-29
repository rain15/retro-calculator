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
        case Empty = "Empty"
    }
    
    @IBOutlet weak var outputLabel: UILabel!
    
    var currentOperation:Operation = Operation.Empty
    
    var btnSound: AVAudioPlayer!
    
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var result = ""
    
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
        processOperation(currentOperation)

    }
    
    func processOperation(op: Operation) {

        print("Operation is \(currentOperation)")
       
        if currentOperation != Operation.Empty {
                //do some math
            
            if runningNumber != "" {
                
         
                rightValStr = runningNumber
                print("left value string is " + leftValStr)
                print("right value string is " + rightValStr)
                
                runningNumber = ""
                
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                }
                else if currentOperation == Operation.Divide {
                    result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                    
                }
                else if currentOperation == Operation.Add {
                    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                }
                else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                }
                
                leftValStr = result
                outputLabel.text = result
              
            }
            
            currentOperation = op
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

