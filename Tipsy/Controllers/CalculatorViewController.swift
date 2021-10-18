//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    var tipCalculator = TipCalculator()
    
    @IBOutlet weak var settperValue: UIView!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    var amount : Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)

        if (sender.currentTitle == "0%") {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tipCalculator.percentage = 0.0
        }
        if (sender.currentTitle == "10%") {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            tipCalculator.percentage = 0.1
        }
        if (sender.currentTitle == "20%") {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            tipCalculator.percentage = 0.2
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let amount: Float = Float(billTextField.text ?? "0.0") ?? 0.0
        let people: Float = Float(splitNumberLabel.text ?? "0.0") ?? 0.0
        tipCalculator.amount = amount
        tipCalculator.setPeople(number: people)
        
        self.performSegue(withIdentifier: "tipCall", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tipCall" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.amountPerPerson = tipCalculator.getSplitAmount()
        }
    }
    
    @IBAction func billValueEntered(_ sender: UITextField) {
        billTextField.text = sender.text
    }
    
}

