//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    
    
    var currTip : Float = 0.1
    @IBAction func tipChanged(_ sender: UIButton) {
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let percentagesInDecimal : [String?: Float] = [
            zeroPctButton.titleLabel!.text: 0.0,
            tenPctButton.titleLabel!.text: 0.1,
            twentyPctButton.titleLabel!.text: 0.2
        ]
        
        currTip = percentagesInDecimal[sender.currentTitle!]!
        billTextField.endEditing(true)
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let billValue = Float(billTextField.text ?? "0.0")!
        let tipValue = currTip
        let splitValue = Float(splitNumberLabel.text ?? "0")!
        
        calculatorBrain.calculateResult(billValue: billValue, tipValue: tipValue, splitValue: splitValue)
        
        performSegue(withIdentifier: "goToResult", sender: self)
        print(tipValue)
        print(currTip)
    }
    
    // ((125.5 * 0.2) + 125.5) / 5
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultsViewController

            destinationVC.totalValue = calculatorBrain.getResult()
            destinationVC.settingValue = "Split between \(Int(splitNumberLabel.text!) ?? 0) people, with \(Int(currTip * 100))% tip."
            
        }
        

    }

}

