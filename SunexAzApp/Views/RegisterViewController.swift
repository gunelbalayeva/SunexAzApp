//
//  RegisterViewController.swift
//  SunexAzApp
//
//  Created by User on 10.04.25.
//

import UIKit

class RegisterViewController: UIViewController {
    private let networKService:NetworkService = NetworkService()
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var idSeriaTextField: UITextField!
    @IBOutlet weak var idNumberTextField: UITextField!
    @IBOutlet weak var branchTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Qeydiyyat"
        scrollView.contentInset.bottom = 100
        nameTextField.layer.cornerRadius = 16
    }
    
    @IBAction func senderClickButton(){
        
        let request = RegisterModel.Request(
            Name: nameTextField.text ?? "",
            Surname: surnameTextField.text ?? "",
            Email: emailTextField.text ?? "",
            PhoneNumber: phoneTextField.text ?? "",
            DocumentNumber: idSeriaTextField.text ?? "",
            FinCode: idSeriaTextField.text ?? "",
            BranchName: "Yasamal",
            Address: addressTextField.text ?? "",
            UserName: userNameTextField.text ?? "",
            Password: passwordTextField.text ?? "",
            RePassword: repeatPasswordTextField.text ?? ""
        )
        networKService.register(with: request) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    print("Response: \(response)")
                    let token = response.data
                    UserDefaults.standard.set(token, forKey: "accessToken")
                    
                    self.showAlert(title: "Uğurlu qeydiyyat", message: "Qeydiyyat tamamlandı!") {
                        if let vc = self.storyboard?.instantiateViewController(withIdentifier: HomePageViewController.identifier) as? HomePageViewController {
                            vc.token = token
                            self.navigationController?.pushViewController(vc, animated: true)
                            print("Navigation başlandı")
                        }
                    }
                case .failure(let error):
                    if let networkError = error as? NetworkError {
                        self.showAlert(title: "Xəta", message: networkError.message)
                        print("Error: \(networkError.message)")
                    } else {
                        self.showAlert(title: "Xəta", message: "Bilinməyən xəta baş verdi.")
                        print("Error: \(error.localizedDescription)")
                    }
                }
            }
        }
    }
    func showAlert(title: String, message: String, handler: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            handler?()
        })
        self.present(alertController, animated: true)
    }
    
}
