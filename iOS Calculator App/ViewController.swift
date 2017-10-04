//
//  ViewController.swift
//  iOS Calculator App
//
//  Created by Samuel Ruiz on 10/3/17.
//  Copyright © 2017 Samuel Ruiz. All rights reserved.
//

import UIKit

enum modes {
    case not_set
    case addition
    case subtraction
}

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    var labelString:String = "0"
    var currentModes:modes = modes.not_set
    var numSaved:Int = 0
    var lastButtonWasMode:Bool = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressPlus(_ sender: Any) {
        changeMode(newMode: modes.addition)
    }
    
    @IBAction func didPressSubtract(_ sender: Any) {
        changeMode(newMode: modes.subtraction)
        
    }
    
    @IBAction func didPressEquals(_ sender: Any) {
    }
    
    @IBAction func didPressClear(_ sender: Any) {
        labelString = "0"
        currentModes = modes.not_set
        numSaved = 0
        lastButtonWasMode = false
        label.text = "0"
    }
    
    @IBAction func didPressNumber(_ sender: UIButton) {
        // Got the string value that was inside the button that was Pressed
        let stringValue:String? = sender.titleLabel?.text
        
        if (lastButtonWasMode == true) {
            lastButtonWasMode = false
            labelString = "0"
        }
        
        // Append the string value on to the labelString
        labelString = labelString.appending(stringValue!)
        // Called updateText() to update the text of the label to the new
        //    string with the appended number
        updateText()
        
    }
    
    func updateText() {
        guard let labelInt:Int = Int(labelString) else {
            return
        }
        if (currentModes == modes.not_set) {
            numSaved = labelInt
        }
        
        label.text = "\(labelInt)"
    }
    
    func changeMode(newMode:modes) {
        if (numSaved == 0) {
            return
        }
        
        currentModes = newMode
        lastButtonWasMode = true
    }
    
    

}

