//
//  ViewController.swift
//  Project-Calc
//
//  Created by Kenji Akiba on 2/8/21.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var performingMath = false
    var operation = 0
    
    @IBOutlet weak var results: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if performingMath == true {
            results.text = String(sender.tag-1)
            numberOnScreen = Double(results.text!)!
            performingMath = false
        } else {
            results.text = results.text! + String(sender.tag-1)
            numberOnScreen = Double(results.text!)!
        }
    }
    
    @IBAction func calculatingBtns(_ sender: UIButton) {
        if results.text != "" && sender.tag != 11 && sender.tag != 18 {
            previousNumber = Double(results.text!)!
            
            if sender.tag == 14 { //Divide
                results.text = "/"
            }
            else if sender.tag == 15 { //Multiply
                results.text = "x"
            }
            else if sender.tag == 16 { //Subtraction
                results.text = "-"
            }
            else if sender.tag == 17 { //Addition
                results.text = "+"
            }
            
            operation = sender.tag
            performingMath = true
        }
        else if sender.tag == 18 {
            if operation ==  14 {
                results.text = String(previousNumber / numberOnScreen)
            }
            else if operation ==  15 {
                results.text = String(previousNumber * numberOnScreen)
            }
            else if operation ==  16 {
                results.text = String(previousNumber - numberOnScreen)
            }
            else if operation ==  17 {
                results.text = String(previousNumber + numberOnScreen)
            }
        }
        else if sender.tag == 11 {
            results.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }
    }
    
    
    
    @IBOutlet weak var roundedC: UIButton!
    @IBOutlet weak var roundedDivide: UIButton!
    @IBOutlet weak var roundedMultiply: UIButton!
    @IBOutlet weak var roundedMinus: UIButton!
    @IBOutlet weak var roundedPlus: UIButton!
    @IBOutlet weak var roundedEqual: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Buttons that are going to be rounded
        
        roundedC.layer.cornerRadius = 6
        roundedDivide.layer.cornerRadius = 6
        roundedMultiply.layer.cornerRadius = 6
        roundedMinus.layer.cornerRadius = 6
        roundedPlus.layer.cornerRadius = 6
        roundedEqual.layer.cornerRadius = 6
    }


}

