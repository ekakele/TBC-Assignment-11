//
//  ViewController.swift
//  Assignment-11-iOS14
//
//  Created by Eka Kelenjeridze on 22.10.23.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateButton.layer.cornerRadius = 5
    }
    
    //MARK: - IBActions
    //set and update switch states & label accordingly
    @IBAction func switchStateChanged(_ sender: UISwitch) {
        if sender.isOn {
            stateLabel.text = "GCD" //Greatest common divisor
        } else {
            stateLabel.text = "LCM" //Least Common Multiple
            sender.subviews[0].subviews[0].backgroundColor = .gray
        }
    }
    
    //make the "calculate" button functional
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        let number1 = convertToInt(textField: textField1)
        let number2 = convertToInt(textField: textField2)
        let result: Int
        
        if number1 != nil && number2 != nil && switchButton.isOn == true {
            result = calculateGCD(num1: number1!, num2: number2!)
            resultLabel.text = String(result)
        } else if number1 != nil && number2 != nil && switchButton.isOn != true {
            result = calculateLCM(num1: number1!, num2: number2!)
            resultLabel.text = String(result)
        } else {
            resultLabel.text = "Error"
        }
    }
    
    //MARK: - functions
    
    
    
    //converting string to int (if it's possible)
    func convertToInt(textField: UITextField) -> Int? {
        textField.backgroundColor = .white
        if let convertedToInt = Int(textField.text!) {
            return convertedToInt
        } else {
            textField.backgroundColor = .red
            return nil
        }
    }
    
    //Greatest Common Divisor (GCD) calculator
    func calculateGCD(num1: Int, num2: Int) -> Int {
        var number1 = num1
        var number2 = num2
        
        while number2 != 0 {
            let temporarySavedNumber = number2
            number2 = number1 % number2 // saving the remain
            number1 = temporarySavedNumber
        }
        return number1
    }
    
    //Greatest Common Divisor (GCD) calculator
    func calculateLCM(num1: Int, num2: Int) -> Int {
        
        let multiplication = num1 * num2
        let GCD = calculateGCD(num1: num1, num2: num2)
        let result = multiplication / GCD
        return result
    }
}
