//
//  selectDifficultyViewController.swift
//  GuessingGame
//
//  Created by Zachary Harper on 10/10/18.
//  Copyright © 2018 Zachary Harper. All rights reserved.
//

import UIKit

class SelectDifficultyViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let guessingGameViewController = segue.destination as? ViewController else{
            return
        }
        
        
        switch segue.identifier {
        case "EasyButtonToGame":
            guessingGameViewController.maximumNumber = 50
            
        case "HardGame":
            break
        case "MediumGame":
            break
        default:
            break
        }
    }
}
