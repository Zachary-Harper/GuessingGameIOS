//
//  ViewController.swift
//  GuessingGame
//
//  Created by Zachary Harper on 10/9/18.
//  Copyright © 2018 Zachary Harper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: UI Outlets
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var guessingGame: UILabel!
    @IBOutlet weak var numberRange: UILabel!
    @IBOutlet weak var guessHereField: UITextField!
    
    
    @IBOutlet weak var playAgainButtonOutlet: UIButton!
    @IBOutlet weak var guessButtonOutlet: UIButton!
    @IBOutlet weak var feedbackLabel: UILabel!
    
    @IBOutlet weak var guessesRemainingLabel: UILabel!
    @IBAction func guessButton(_ sender: Any) {
        let userInput = guessHereField.text!
        
        guard let guess = Int(userInput) else {
            feedbackLabel.text = "You didn't give me a number!"
            return
        }
        
        makeAGuess(guess)
    }
    
    
    @IBAction func playAgainButton(_ sender: Any) {
        
        restart()
    }
    
    
    
    
    
    
    
    // MARK: Properties
    var randomNumber = 0
    var guessesRemaining = 5
    
    var minimumNumber = 1
    var maximumNumber = 100
    var numberOfGuesses = 5
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        restart()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: Functions
    
    func makeAGuess(_ guess: Int) {
        guard guess >= 1 && guess <= maximumNumber else {
            feedbackLabel.text = "Your number wasn't between 0 and \(maximumNumber) you dangus"
            return
        }
        guard guessesRemaining > 0 else {
            feedbackLabel.text = "You lose!! Sorry BRO"
            setUpUIForRestart()
            return
        }
        if guess == randomNumber {
            feedbackLabel.text = "You Win!!! Congrats"
        
            
            
        } else if guess < randomNumber {
            feedbackLabel.text = "Guess HIGHER"
            
        } else {
            feedbackLabel.text = "Guess LOWER"
        }
        
        guessesRemaining -= 1
        guessesRemainingLabel.text = "You have \(guessesRemaining) guesses left "
        
        
    }
    
    
    
    func restart() {
        // new random number
        randomNumber = Int.random(in: minimumNumber...maximumNumber)
        // reset guesses remaining
        guessesRemaining = numberOfGuesses
        // clear text field
        guessHereField.text = ""
        // enable text field
        guessButtonOutlet.isEnabled = true
        // hide play again button
        playAgainButtonOutlet.isHidden = true
        // show guess button
        guessButtonOutlet.isHidden = false
        // reset feedback label
        feedbackLabel.text = "Guess a number!"
        // reset guesses remaining label
        guessesRemainingLabel.text = "You have \(guessesRemaining) guesses left."
        // Set instruction label
        instructionsLabel.text = "Please enter a number between 1 and \(maximumNumber)"
        // set guess here re-enabled
        guessHereField.isEnabled = true
        
    }
    func setUpUIForRestart() {
        
        //disable input
        guessHereField.isEnabled = false
        
        //hide guess button
        guessButtonOutlet.isHidden = true
        
        //Unhide play again button
        playAgainButtonOutlet.isHidden = false
        
    }
}

