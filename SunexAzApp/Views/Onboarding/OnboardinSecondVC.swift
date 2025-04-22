//
//  OnboardinSecondVC.swift
//  SunexAzApp
//
//  Created by User on 10.04.25.
//

import UIKit

class OnboardinSecondVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func continueButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: ThirdVC.identifier) as? ThirdVC {
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .crossDissolve
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    

}
