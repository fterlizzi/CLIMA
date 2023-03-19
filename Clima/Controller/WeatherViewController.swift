//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var citySearchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // il TF delega il VC
       // A text field calls the methods of its delegate in response to important changes. You use these methods to validate text that was typed by the user, to respond to specific interactions with the keyboard, and to control the overall editing process.
        citySearchTextField.delegate = self
        
    }

    
    @IBAction func getCityToSearch(_ sender: UIButton) {
        // il TF e tutte le sue subview abbandonano lo stato di primo risponditore. la window della tastiera viene chiusa
        citySearchTextField.endEditing(true)
        if let safeCityToSearch = citySearchTextField.text {
            print(safeCityToSearch)
            cityLabel.text = safeCityToSearch
            if safeCityToSearch == "" {
                print("text field empty")
            }
        } else {
            print(" text field is nil")
        }
        
    }
    
    // // called when 'return' key pressed. return NO to ignore.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("return pressed T")
        // il TF e tutte le sue subview abbandonano lo stato di primo risponditore. la window della tastiera viene chiusa
        
        textField.endEditing(true)
        if let safeCityToSearch = textField.text {
            print(safeCityToSearch)
            cityLabel.text = safeCityToSearch
            return true
        }else {
            print("no city entered ")
            return false
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("2. TextField did end editing method called")
      
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("1. TextField did begin  editing ")
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if (textField.text != ""){
            cityLabel.text = textField.text
            textField.text = ""
            textField.placeholder = " insert city to search"
            return true
        } else {
            return false
        }
    }
    
    
}

