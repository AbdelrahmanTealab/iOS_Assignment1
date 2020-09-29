//
//  ViewController.swift
//  Assignment1
//
//  Created by Abdelrahman  Tealab on 2020-09-22.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - variables
    
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var previousLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    var isNegative = false
        
    //MARK: - UI

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    func updateUI(){
        resultLabel.text = "0"
        operandLabel.text = nil
        previousLabel.text = nil
        isNegative = false
    }
    //MARK: - button UI functions
    
    @IBAction func digitPressed(_ sender: UIButton) {
        if resultLabel.text! == "0"{
            resultLabel.text = sender.currentTitle!
        }
        else if resultLabel.text! == "-0"{
            resultLabel.text = "-\(sender.currentTitle!)"
        }
        else{
            resultLabel.text?.append(sender.currentTitle!)
        }
    }
    
    @IBAction func acPressed(_ sender: UIButton) {
        updateUI()
    }
    
    @IBAction func clearPressed(_ sender: UIButton) {
        if resultLabel.text != "0"{
            resultLabel.text!.removeLast()
        }
    }
    
    @IBAction func operandPressed(_ sender: UIButton) {
        operandLabel.text = sender.currentTitle!
        previousLabel.text = resultLabel.text!
        resultLabel.text = "0"
        isNegative = false
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
            resultLabel.text!.insert("-",at: resultLabel.text!.startIndex)
        }
        else{
            resultLabel.text!.removeFirst()
        }
    }
    
}

