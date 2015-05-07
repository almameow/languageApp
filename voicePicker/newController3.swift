//
//  newController3.swift
//  voicePicker
//
//  Created by Alma Maria Livingston on 5/7/15.
//  Copyright (c) 2015 Alma Livingston. All rights reserved.
//

import Foundation

import UIKit
import AVFoundation

class newController3: UIViewController {
    
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
    
    let strings = ["안녕하세요", "你好", "नमस्ते"]
    
    var colors = ["Korean", "Chinese (China)", "Chinese (Hong Kong)", "Chinese (Taiwan)", "Hindi"]
    
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
        if accent == "Chinese (China)" {
            accentChoice = "zh-CN"
            textField.text = strings[1]
        } else if accent == "Chinese (Hong Kong)" {
            accentChoice = "zh-HK"
            textField.text = strings[1]
        } else if accent == "Chinese (Taiwan)" {
            accentChoice = "zh-TW"
            textField.text = strings[1]
        } else if accent == "Hindi" {
            accentChoice = "hi-IN"
            textField.text = strings[2]
        } else if accent == "Korean" {
            accentChoice = "ko-KR"
            textField.text = strings[0]
        }
        println("Accent is \(accentChoice)")
    }
    ////// END PICKER STUFF //////
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
}


