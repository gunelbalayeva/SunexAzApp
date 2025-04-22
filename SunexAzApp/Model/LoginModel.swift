//
//  LoginModel.swift
//  SunexAzApp
//
//  Created by User on 12.04.25.
//

import UIKit
import Foundation

struct LoginModel {
    
    struct Request: Encodable {
        let email: String
        let password: String
    }
    
    struct Response : Decodable {
        let message: String
        let data: String
    }
}
