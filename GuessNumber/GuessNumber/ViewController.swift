//
//  ViewController.swift
//  GuessNumber
//
//  Created by LeoKao on 2017/4/22.
//  Copyright © 2017年 LeoKao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    var answer = Int(arc4random_uniform(100)+1)
    var maxNumber = 100
    var minNumber = 1
    var isOver = false
    
    @IBAction func guessButton(_ sender: UIButton) {
        if isOver == false{     //continue game
            print("Answer = \(answer)")
            let guessNumber = Int(inputTextField.text!)
            if guessNumber == nil {
                messageLabel.text = String("Please enter a number")
            }else{
                if guessNumber! > maxNumber || guessNumber! < minNumber {
                    messageLabel.text = String("Please input number between \(minNumber) ~ \(maxNumber)")
                }else{
                    if guessNumber! == answer{
                        messageLabel.text = String("You are correct!! Press [Guess] to play again.")
                        isOver = true
                    }else{
                        if guessNumber! < answer {
                            minNumber = guessNumber!
                        }else{
                            maxNumber = guessNumber!
                        }
                        messageLabel.text = String("Number will between \(minNumber) ~ \(maxNumber)")
                    }
                }
                inputTextField.text = ""
            }
        }else{  //set new game
            maxNumber = 100
            minNumber = 1
            messageLabel.text = "Guess a number between \(minNumber) ~ \(maxNumber) :)"
            isOver = false;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.becomeFirstResponder()
    }

}

