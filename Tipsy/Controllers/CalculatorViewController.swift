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
    
    var tipPercent: Double = 0.1
    
    var tipValue: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tipChanged(self.tenPctButton)
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        [self.zeroPctButton, self.tenPctButton, self.twentyPctButton].forEach { (button) in
            button?.isSelected = false
        }
        
        sender.isSelected = true
        
        let percent = String(sender.currentTitle!.dropLast())

        self.tipPercent = Double(percent)! / 100
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        self.splitNumberLabel.text = String(format: "%.0f", sender.value)
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        let billValue = self.billTextField.text == "" || self.billTextField.text == nil ? "0.0" : self.billTextField.text
        self.tipValue = Double(billValue!) ?? 0.0 / self.tipPercent
    }
}
