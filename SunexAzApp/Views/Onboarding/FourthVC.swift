//
//  FourthVC.swift
//  SunexAzApp
//
//  Created by User on 10.04.25.
//

import UIKit

class FourthVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: SignInViewController.identifier) as? SignInViewController {
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .crossDissolve
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    @IBAction func registerButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: RegisterViewController.identifier) as? RegisterViewController {
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .crossDissolve
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
