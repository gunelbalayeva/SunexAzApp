//
//  ErrorViewController.swift
//  SunexAzApp
//
//  Created by User on 10.04.25.
//

import UIKit

class ErrorViewController: UIViewController {


       override func viewDidLoad() {
           super.viewDidLoad()

       }
    @IBAction func comeBackButton(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: HomePageViewController.identifier) as? HomePageViewController else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}
