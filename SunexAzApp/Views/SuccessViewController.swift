//
//  SuccessViewController.swift
//  SunexAzApp
//
//  Created by User on 10.04.25.
//

import UIKit

class SuccessViewController: UIViewController {
    
    var token: String?
    
    @IBOutlet weak var tokenLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tokenLabel.text = token ?? "Yoxdur"
    }
    
    @IBAction func continueButton(_ sender: UIButton) {
        
    }
}
