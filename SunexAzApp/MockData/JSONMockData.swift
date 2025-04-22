//
//  JSONMockData.swift
//  SunexAzApp
//
//  Created by User on 17.04.25.
//

import Foundation

struct JSONMockData {
    func loadMockLoginResponse() -> LoginModel.Response? {
        guard let url = Bundle.main.url(forResource: "LoginMockResponse", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            print("Login mock response file not found.")
            return nil
        }
        
        do {
            let response = try JSONDecoder().decode(LoginModel.Response.self, from: data)
            return response
        } catch {
            print("Failed to decode login mock response: \(error)")
            return nil
        }
    }
    
    func loadMockRegisterResponse() -> RegisterModel.Response? {
        guard let url = Bundle.main.url(forResource: "RegisterMockResponse", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            print("Mock response file not found.")
            return nil
        }
        
        do {
            let response = try JSONDecoder().decode(RegisterModel.Response.self, from: data)
            return response
        } catch {
            print("Failed to decode mock response: \(error)")
            return nil
        }
    }
    func loadMockDashboardResponse() -> DashboardModel.Response? {
        guard let url = Bundle.main.url(forResource: "DashboardMockResponse", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            print("Mock response file not found.")
            return nil
        }
        
        do {
            let response = try JSONDecoder().decode(DashboardModel.Response.self, from: data)
            return response
        } catch {
            print("Failed to decode mock response: \(error)")
            return nil
        }
    }
    func loadMockForgotPasswordResponse() -> ForgotPasswordResponse?{
        guard let url = Bundle.main.url(forResource: "ForgotPasswordMock", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            print("Mock response file not found.")
            return nil
        }
        do {
            let response = try JSONDecoder().decode(ForgotPasswordResponse.self, from: data)
            return response
        } catch {
            print("Failed to decode mock response: \(error)")
            return nil
        }
    }
}
