//
//  ViewController.swift
//  Assignment1
//
//  Created by Abdelrahman  Tealab (ID: 301164103) on 2020-09-22.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - variables
    
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var previousLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    var isNegative = false
    var calculator = Calculator()
        
    //MARK: - UI

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    //to refresh the app
    func updateUI(){
        resultLabel.text = "0"
        operatorLabel.text = nil
        previousLabel.text = "0"
        isNegative = false
    }
    
    //just a cool flashing animation
    @IBAction func buttonFlash(_ sender: UIButton){
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            sender.alpha = 1.0
        }
    }
    
    //MARK: - button functions
    
    //when adding a digit, i check if it's 0 or not
    //if its 0 or -0 then tranform the 0 to the digit entered
    //if its not then append to the string
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
    //ac button (All Clear) will refresh the entire application
    @IBAction func acPressed(_ sender: UIButton) {
        updateUI()
    }
    //when clear (backspace) is pressed, i remove the last character from the string
    //only when its not the last character and when its not 2 characters starting with a "-"
    @IBAction func clearPressed(_ sender: UIButton) {
        if resultLabel.text!.count > 1 {
            if resultLabel.text!.count == 2 && resultLabel.text!.hasPrefix("-") {
                //incase i have something like "-3" then deleting it will turn it to 0
                resultLabel.text = "0"
                isNegative = false
            }
            else if resultLabel.text! != "0" && resultLabel.text! != "-0" {
                resultLabel.text!.removeLast()
            }
        }
        else {
            resultLabel.text = "0"
            isNegative = false
        }
    }
    
    //When operator is pressed, a few conditions will be checked in order
    //to prevent errors and then the operator will be displayed in the operator label
    //also whatever number in the resultLabel will be sent to the previousLabel display
    @IBAction func operatorPressed(_ sender: UIButton) {
        
        let previous = previousLabel.text!
        let current = resultLabel.text!
        
        let operatorSymbol = operatorLabel.text ?? "+"
        
        //checking whether the number ends with a dot or not in order to keep the string clean
        if resultLabel.text!.hasSuffix(".") {
            resultLabel.text!.removeLast()
        }
        //negative zero is possible when the user starts with the sign button, so to keep it clean i remove the sign incase an operator is pressed
        //this way i conveniently turn abnormalities such as "-0." to a clean "0" without affecting the user experience
        if resultLabel.text! == "-0"{
            resultLabel.text = "0"
        }
        //after the string is cleaned, it is then sent to the previousLabel
        //and the resultLabel is resetted to 0
        previousLabel.text = resultLabel.text!
        resultLabel.text = "0"
        isNegative = false
        
        //the below switch statement is to enable sequence calculations by pressing operators
        switch operatorSymbol {
        case "÷":
            print(operatorSymbol)
            previousLabel.text = calculator.division(digit1: Float(previous), digit2: Float(current))
        case "×":
            print(operatorSymbol)
            previousLabel.text = calculator.multiplication(digit1: Float(previous), digit2: Float(current))

        case "-":
            print(operatorSymbol)
            previousLabel.text = calculator.subtraction(digit1: Float(previous), digit2: Float(current))

        case "+":
            print(operatorSymbol)
            previousLabel.text = calculator.addition(digit1: Float(previous), digit2: Float(current))

        case "%":
            print(operatorSymbol)
            previousLabel.text = calculator.percentage(digit1: Float(previous), digit2: Float(current))

        default:
            print(sender.currentTitle!)
        }
        operatorLabel.text = sender.currentTitle!
    }
    
    //when equal is pressed, the previous label and operator label will passed on as arguments to
    //the function related to the operator on the screen
    @IBAction func equalPressed(_ sender: UIButton) {
        let previous = previousLabel.text!
        let current = resultLabel.text!
        let operatorSymbol = operatorLabel.text ?? "+"

        switch operatorSymbol {
        case "÷":
            print(operatorSymbol)
            previousLabel.text = calculator.division(digit1: Float(previous), digit2: Float(current))
        case "×":
            print(operatorSymbol)
            previousLabel.text = calculator.multiplication(digit1: Float(previous), digit2: Float(current))

        case "-":
            print(operatorSymbol)
            previousLabel.text = calculator.subtraction(digit1: Float(previous), digit2: Float(current))

        case "+":
            print(operatorSymbol)
            previousLabel.text = calculator.addition(digit1: Float(previous), digit2: Float(current))

        case "%":
            print(operatorSymbol)
            previousLabel.text = calculator.percentage(digit1: Float(previous), digit2: Float(current))

        default:
            print(sender.currentTitle!)
        }
        resultLabel.text = "0"
        operatorLabel.text = nil
        isNegative = false
    }
    
    //When the point button is pressed, it will add a "." to the string
    //only when the string doesnt contain a dot already
    @IBAction func decimalPressed(_ sender: UIButton) {
        if let result = resultLabel.text {
            if !result.contains("."){
                resultLabel.text!.append(".")
            }
        }
    }
    //When ± button is pressed, a boolean will be toggled to identify whether
    //its currently negative or positive and insert the negative symbol accordingly
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

//MARK: - extensions

//makes the Stackview corners slightly rounded
extension UIStackView{
    open override func draw(_ rect: CGRect){
        self.layer.cornerRadius = 10;
        self.layer.masksToBounds = true;
    }
}

//add shadows for the buttons background to make it look more 3D
extension UIButton {
    open override func draw(_ rect: CGRect) {
        let shadowPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 10 + 4, height: 10 + 4))
        self.layer.shadowPath = shadowPath.cgPath

        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 0
        self.layer.shadowOpacity = 1

        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1
    }
}
