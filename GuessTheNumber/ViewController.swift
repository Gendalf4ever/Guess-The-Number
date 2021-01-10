//
//  ViewController.swift
//  GuessTheNumber
//
//  Created by Master on 05.01.2021.
//  Copyright © 2021 Master. All rights reserved.
//

import UIKit
import Foundation
class ViewController: UIViewController {
var guessedNumber = Int.random(in: 1...10)
  
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(guessedNumber)
        Answer.isHidden = true
        someLabel.isHidden = true
    }

    @IBOutlet weak var Answer: UILabel!
    @IBOutlet weak var someLabel: UILabel!
    @IBOutlet weak var theNumber: UITextField!
     
    @IBOutlet weak var upperBorderTextField: UITextField!
    
    @IBOutlet weak var lowerBorderTextField: UITextField!
    
    @IBAction func saveActionsButton(_ sender: Any) {
        guard let upperBorder = upperBorderTextField.text else {return}
        guard let lowerBorder = lowerBorderTextField.text else {return}
        let upperBorderInt:UInt32? = UInt32(upperBorder)
        let lowerBorderInt:UInt32? = UInt32(lowerBorder)
        print("upperBorderInt: ", upperBorderInt)
        print("lowerBorderInt: ", lowerBorderInt)
        var random_number = Int(arc4random_uniform(upperBorderInt ?? 10) + lowerBorderInt! ?? 1 )
           print ("random = ", random_number);
        
    }
    @IBAction func guessButton(_ sender: Any) {
        guard let number = theNumber.text else {return}
    
        let intNumber:Int? = Int(number)
          someLabel.isHidden = false
        if (intNumber != guessedNumber) {
            if (intNumber ?? guessedNumber < guessedNumber){
                 someLabel.text = "Загаданное число больше"
            }
           else if (intNumber ?? guessedNumber > guessedNumber){
                           someLabel.text = "Загаданное число меньше"
                      }
            
            Answer.isHidden = false
            Answer.text = "Неправильно!"
            Answer.textColor = UIColor.red
        }
        else {
            Answer.isHidden = false
            Answer.text = "Правильно!"
            someLabel.text = "Вы угадали!"
            Answer.textColor = UIColor.green
        }
    }
    
}

