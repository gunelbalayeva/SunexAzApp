//
//  DashboardModel.swift
//  SunexAzApp
//
//  Created by User on 16.04.25.
//

import Foundation
struct DashboardModel{
    struct User: Decodable {
        let Name: String
        let Surname: String
        let CustomerNumber: Int
        let Username: String
        let BalanceTL: Double
        let BalanceUSD: Double
        let BalanceBonus: Double
        let BranchName: String
        let isVipUser: Bool
        let Email: String
        let PhoneNumber: String
    }
    
    struct NewsItem: Decodable {
        let id: Int
        let imageUrl: String
    }
    
    struct Response: Decodable {
        let user: User
        let currentlyTotalAmountInMonth: Double
        let news: [NewsItem]
        let notificationCount: Int
    }
    
    struct Request: Encodable {
        let Username: String
        let Password: String
    }
}
