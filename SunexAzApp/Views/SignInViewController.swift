//
//  SignInViewController.swift
//  SunexAzApp
//
//  Created by User on 10.04.25.
//

import UIKit
class SignInViewController:UIViewController {
    
    private let networKService:NetworkService = NetworkService()
    @IBOutlet weak var emailTextField:UITextField!
    @IBOutlet weak var passwordTextField:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         title = "Daxil ol"
    }
    

    @IBAction func forgetPassword(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: ForgetPasswordViewController.identifier) as? ForgetPasswordViewController {
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .crossDissolve
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction  func didTapLoginButton(){
        guard let email = emailTextField.text, !email.isEmpty,
                  let password = passwordTextField.text, !password.isEmpty else {
                print("Email və ya şifrə boş ola bilməz.")
                return
            }
            networKService.login(with: email, password: password) { result in
                switch result {
                case .success(let response):
                    let token = response.data
                    print("Login successful, token: \(token)")
                    DispatchQueue.main.async {
                        if let vc = self.storyboard?.instantiateViewController(withIdentifier: HomePageViewController.identifier) as? HomePageViewController {
                            vc.token = token
                            self.navigationController?.pushViewController(vc, animated: true)
                        }
                    }

                case .failure(let error):
                    print("Login failed: \(error.localizedDescription)")
                }
        }
  }
}
