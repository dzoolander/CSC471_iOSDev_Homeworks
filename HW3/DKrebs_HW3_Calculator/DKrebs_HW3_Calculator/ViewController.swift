//
//  ViewController.swift
//  DKrebs_HW3_Calculator
//
//  Created by user165127 on 2/4/20.
//  Copyright © 2020 DePaul University CDM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    var firstNumText = ""
    var secondNumText = ""
    var firstNum = 0
    var secondNum = 0
    var op = ""
    var isFirstNum = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func buttonPressed(_ sender: UIButton) {
        let currentText = resultLabel.text!
        let textLabel = sender.titleLabel?.text
        if let text = textLabel {
            switch text {
            case "+":
                op = text
                isFirstNum = false
                resultLabel.text = "\(currentText) \(op) "
                break
            case "=":
                let result = calculate()
                resultLabel.text = "\(result)"
                firstNum = result
                break
            default:
                if isFirstNum {
                    firstNumText = "\(firstNumText)\(text)"
                }
                else {
                    secondNumText = "\(secondNumText)\(text)"
                }
                resultLabel.text = "\(currentText)\(text)"
                break
            }
        }
    }
    
    @IBAction func clearLabel(_ sender: UIButton) {
        resultLabel.text = ""
        firstNumText = ""
        secondNumText = ""
        isFirstNum = true
    }
    
    func calculate() -> Int {
        firstNum = Int(firstNumText)!
        secondNum = Int(secondNumText)!
        return firstNum + secondNum
    }
}

