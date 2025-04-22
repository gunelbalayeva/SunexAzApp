//
//  ThirdVC.swift
//  SunexAzApp
//
//  Created by User on 10.04.25.
//

import UIKit

class ThirdVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func continueButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: FourthVC.identifier) as? FourthVC {
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .crossDissolve
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
}
