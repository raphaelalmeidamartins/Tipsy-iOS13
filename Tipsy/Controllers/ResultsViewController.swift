//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Raphael Martins on 30/07/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    var billValue: Double?
    
    var tipPercent: Int?
    
    var splitNumber: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.updateUI()
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    func updateUI() {
        self.totalLabel.text = String(format: "%.2f", self.billValue!)
        self.settingsLabel.text = "Split between \(self.splitNumber!) people with \(self.tipPercent!)% tip"
    }
}
