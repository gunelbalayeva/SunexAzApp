//
//  ForgetPasswordViewController.swift
//  SunexAzApp
//
//  Created by User on 10.04.25.
//

import UIKit

class ForgetPasswordViewController: UIViewController {
    
    private let networKService: NetworkService = NetworkService()
    @IBOutlet weak var forgetpasswordEmailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Şifrəmi unutdum"
    }
    
    @IBAction func senderForgetPassword(_ sender: UIButton) {
        guard let email = forgetpasswordEmailTextField.text, !email.isEmpty else {
            self.showAlert(with: "Xəta", message: "Zəhmət olmasa email daxil edin")
            return
        }
        
        if email.lowercased() == "gunelbalayeva@gmail.com" {
            networKService.forgotPassword(with: email) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let response):
                        if let token = response.data {
                            self.navigateToSuccess(with: token)
                        } else {
                            self.navigateToError()
                        }
                    case .failure(_):
                        self.navigateToError()
                    }
                }
            }
        } else {
            self.navigateToError()
        }
    }
    
    func navigateToSuccess(with token: String) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "SuccessViewController") as? SuccessViewController else {
            return
        }
        vc.token = token
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func navigateToError() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ErrorViewController") as? ErrorViewController else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func showAlert(with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
