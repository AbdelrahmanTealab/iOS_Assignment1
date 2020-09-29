//
//  ViewController.swift
//  Assignment1
//
//  Created by Abdelrahman  Tealab on 2020-09-22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signLabel: UILabel!
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var previousLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    var isNegative = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        operandLabel.text = nil
        signLabel.text = nil
        previousLabel.text = nil
    }

    @IBAction func digitPressed(_ sender: UIButton) {
        if resultLabel.text! == "0"{
            resultLabel.text = sender.currentTitle!
        }
        else{
            resultLabel.text?.append(sender.currentTitle!)
        }
    }
    
    @IBAction func acPressed(_ sender: UIButton) {
        resultLabel.text = "0"
        operandLabel.text = nil
        previousLabel.text = nil
        signLabel.text = nil
    }
    
    @IBAction func operandPressed(_ sender: UIButton) {
        operandLabel.text = sender.currentTitle!
        previousLabel.text = resultLabel.text!
        resultLabel.text = "0"
    }
    
    @IBAction func decimalPressed(_ sender: UIButton) {
        if let result = resultLabel.text {
            if !result.contains("."){
                resultLabel.text!.append(".")
            }
        }
    }
    
    @IBAction func signPressed(_ sender: UIButton) {
        isNegative.toggle()
        if isNegative {
            signLabel.text = "-"
        }
        else{
            signLabel.text = nil
        }
    }
    
}

