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
        guard let vc = storyboard?.instantiateViewController(withIdentifier: FourthVC.identifier) as? FourthVC  else {
            return
        }
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
       }
    
}
    
    

