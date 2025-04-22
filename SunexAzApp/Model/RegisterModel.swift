//
//  RegisterModel.swift
//  SunexAzApp
//
//  Created by User on 14.04.25.
//

import Foundation
import UIKit

struct RegisterModel {
    
    struct Request:Encodable {
        let Name: String
        let Surname: String
        let Email: String
        let PhoneNumber: String
        let DocumentNumber: String
        let FinCode: String
        let BranchName: String
        let Address: String
        let UserName: String
        let Password: String
        let RePassword: String
    }
    
    struct Response:Decodable {
        let message:String
        let data:String
    }
    
}
