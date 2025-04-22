//
//  VipUserInfo.swift
//  SunexAzApp
//
//  Created by User on 15.04.25.
//

import Foundation
import UIKit

struct VipUserInfo {
    
    struct Request: Encodable, Decodable {
        let isVipUser: Bool
        let headerTitle: String
        let headerDescription: String
        let advantages: [String]
    }
    
    struct Response: Decodable {
        let message: String
        let data: Request
    }
}
