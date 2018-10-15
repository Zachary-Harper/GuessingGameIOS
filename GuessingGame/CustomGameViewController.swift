//
//  CustomGameViewController.swift
//  GuessingGame
//
//  Created by Zachary Harper on 10/12/18.
//  Copyright © 2018 Zachary Harper. All rights reserved.
//

import UIKit

class CustomGameViewController: UIViewController {
    @IBOutlet weak var lowerBoundTextField: UITextField!
    
    @IBOutlet weak var upperBoundTextField: UITextField!
    
    @IBOutlet weak var customGuessNumber: UITextField!
    @IBOutlet weak var buttomPlayCustomGame: UIButton!
    
    @IBAction func customGameButtonClicked(_ sender: Any) {
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let guessingGameViewController = segue.destination as? ViewController else{
            return
        }
    
    let minimum = lowerBoundTextField.text!
    let lowerBound = Int(minimum)!
    
        
    let maximum = upperBoundTextField.text!
    let upperBound = Int(maximum)!
    
    let customGuesses = customGuessNumber.text!
    let newGuesses = Int(customGuesses)!
    
    guessingGameViewController.maximumNumber = upperBound
    guessingGameViewController.minimumNumber = lowerBound
    guessingGameViewController.numberOfGuesses = newGuesses
    
        
}
    
}

