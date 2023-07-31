//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!

    @IBOutlet weak var tenPctButton: UIButton!

    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipPercent: Int = 10
    
    var billValue: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tipChanged(self.tenPctButton)
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        self.billTextField.endEditing(true)

        [self.zeroPctButton, self.tenPctButton, self.twentyPctButton].forEach { (button) in
            button?.isSelected = false
        }
        
        sender.isSelected = true
        
        let percent = String(sender.currentTitle!.dropLast())

        self.tipPercent = Int(percent)!
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        self.splitNumberLabel.text = String(format: "%.0f", sender.value)
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        self.billTextField.endEditing(true)
        var totalValue = Double(self.billTextField.text!) ?? 0.0
        totalValue += totalValue * (Double(self.tipPercent) / 100)
        self.billValue = totalValue / Double(self.splitNumberLabel.text!)!
        
        self.performSegue(withIdentifier: "displayResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "displayResult" {
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.billValue = self.billValue
            destinationVC.splitNumber = Int(self.splitNumberLabel.text!)!
            destinationVC.tipPercent = self.tipPercent
        }
    }
}
