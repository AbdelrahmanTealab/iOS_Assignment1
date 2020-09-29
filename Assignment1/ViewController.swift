//
//  ViewController.swift
//  Assignment1
//
//  Created by Abdelrahman  Tealab on 2020-09-22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var previousLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        operandLabel.text = " "
        
    }

    @IBAction func digitPressed(_ sender: UIButton) {
        if resultLabel.text! == "0"{
            resultLabel.text = sender.currentTitle!
        }
        else if resultLabel.text! == "-0"{
            resultLabel.text = "-"
            resultLabel.text!.append(sender.currentTitle!)
        }
        else{
            resultLabel.text?.append(sender.currentTitle!)
        }
    }
    
    @IBAction func acPressed(_ sender: UIButton) {
        resultLabel.text = "0"
        previousLabel.text = "0"
    }
    
    @IBAction func operandPressed(_ sender: UIButton) {
        operandLabel.text = sender.currentTitle!
        if sender.currentTitle! == "-" {
            if resultLabel.text! == "0" {
                resultLabel.text = "-0"
            }
        }
        else{
            previousLabel.text = resultLabel.text!
            resultLabel.text = "0"
        }
    }
    
    @IBAction func decimalPressed(_ sender: UIButton) {
        if let result = resultLabel.text {
            if !result.contains("."){
                resultLabel.text!.append(".")
            }
        }
    }
    
}

