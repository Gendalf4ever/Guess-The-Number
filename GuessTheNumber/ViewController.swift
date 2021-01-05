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
          print(guessedNumber)
        Answer.isHidden = true
    }

    @IBOutlet weak var Answer: UILabel!
    
    @IBOutlet weak var someLabel: UILabel!
    @IBOutlet weak var theNumber: UITextField!
    @IBAction func guessButton(_ sender: Any) {
        guard let number = theNumber.text else {return}
        let intNumber:Int? = Int(number)
        
        if (intNumber != guessedNumber) {
            if (intNumber ?? guessedNumber < guessedNumber){
                 someLabel.text = "Загаданное число меньше"
            }
           else if (intNumber ?? guessedNumber > guessedNumber){
                           someLabel.text = "Загаданное число больше"
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

