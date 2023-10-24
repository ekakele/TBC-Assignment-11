//
//  ViewController.swift
//  Assignment-11-iOS14
//
//  Created by Eka Kelenjeridze on 22.10.23.
//

import UIKit

final class ViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet private weak var stateLabel: UILabel!
    @IBOutlet private weak var switchButton: UISwitch!
    @IBOutlet private weak var firstNumberTextField: UITextField!
    @IBOutlet private weak var secondNumberTextField: UITextField!
    @IBOutlet private weak var calculateButton: UIButton!
    @IBOutlet private weak var resultLabel: UILabel!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateButton.layer.cornerRadius = 5
    }
    
    //MARK: - IBActions
    @IBAction private func switchStateChanged(_ sender: UISwitch) {
        if sender.isOn {
            stateLabel.text = "GCD" //Greatest common divisor
        } else {
            stateLabel.text = "LCM" //Least Common Multiple
            sender.subviews[0].subviews[0].backgroundColor = .gray
        }
    }
    
    @IBAction private func calculateButtonDidTap(_ sender: UIButton) {
        let number1 = convertToInt(textField: firstNumberTextField)
        let number2 = convertToInt(textField: secondNumberTextField)
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
    private func convertToInt(textField: UITextField) -> Int? {
        textField.backgroundColor = .white
        if let convertedToInt = Int(textField.text!) {
            return convertedToInt
        } else {
            textField.backgroundColor = .red
            return nil
        }
    }
    
    private func calculateGCD(num1: Int, num2: Int) -> Int {
        var number1 = num1
        var number2 = num2
        
        while number2 != 0 {
            let temporarySavedNumber = number2
            number2 = number1 % number2 // saving the remain
            number1 = temporarySavedNumber
        }
        return number1
    }
    
    private func calculateLCM(num1: Int, num2: Int) -> Int {
        let multiplication = num1 * num2
        let GCD = calculateGCD(num1: num1, num2: num2)
        let result = multiplication / GCD
        return result
    }
}
