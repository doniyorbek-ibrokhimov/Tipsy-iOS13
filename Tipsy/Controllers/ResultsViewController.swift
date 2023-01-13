//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by DONIYORBEK IBROKHIMOV on 13/01/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalValue:Float?
    var settingValue: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = String(format: "%.2f", totalValue ?? 0.0)
        settingsLabel.text = settingValue ?? "Error occured"
    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
