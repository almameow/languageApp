//
//  ViewController.swift
//  voicePicker
//
//  Created by Alma Maria Livingston on 5/6/15.
//  Copyright (c) 2015 Alma Livingston. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextView!
    
    
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")

    @IBAction func textToSpeech(sender: UIButton) {
        //set myUtterance to text inside text field
        myUtterance = AVSpeechUtterance(string: textField.text)
        myUtterance.voice = AVSpeechSynthesisVoice(language: accentChoice)
        
        //set speech rate
        myUtterance.rate = 0.1
        
        //read text
        synth.speakUtterance(myUtterance)
    }
    
    
    ////// PICKER STUFF //////
    var accentChoice = ""
    
    @IBOutlet weak var myPicker: UIPickerView!
    
    
    var colors = ["American", "Australian", "British", "South African"]
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return colors[row]
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        chooseAccent()
    }
    func chooseAccent() {
        let accent = colors[myPicker.selectedRowInComponent(0)]
        languageSelect(accent)
    }
    
    func languageSelect(accent: String){
        if accent == "American" {
            accentChoice = "en-US"
        } else if accent == "Australian" {
            accentChoice = "en-AU"
        } else if accent == "British" {
            accentChoice = "en-GB"
        } else if accent == "South African" {
            accentChoice = "en-ZA"
        }
        println("Accent is \(accentChoice)")
    }
    ////// END PICKER STUFF //////
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        button.frame = CGRectMake(160, 100, 50, 50)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

}

