//
//  Onboarding1ViewController.swift
//  SunexAzApp
//
//  Created by User on 06.04.25.
//

import UIKit

class Onboarding1ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
    }
    
    @IBAction func continueButton(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: OnboardinSecondVC.identifier) as? OnboardinSecondVC  else {
            return
        }
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
  
    }
}

