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
        guard let vc = storyboard?.instantiateViewController(withIdentifier: SignInViewController.identifier) as? SignInViewController  else {
            return
        }
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }



   @IBAction func registerButton(_ sender: UIButton) {
    guard let vc = storyboard?.instantiateViewController(withIdentifier: RegisterViewController.identifier) as? RegisterViewController  else {
        return
    }
    vc.modalPresentationStyle = .fullScreen
    navigationController?.pushViewController(vc, animated: true)
     }

}
