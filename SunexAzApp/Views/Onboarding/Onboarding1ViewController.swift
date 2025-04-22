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

        // Do any additional setup after loading the view.
    }
    

   
    @IBAction func continueButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: OnboardinSecondVC.identifier) as? OnboardinSecondVC {
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .crossDissolve
           navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
