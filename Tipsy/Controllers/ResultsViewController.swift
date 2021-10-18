//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Virtual Machine on 13/10/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    var tipModel: TipCalculator?
    var amountPerPerson: Float = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.2f", amountPerPerson)
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
   
}
