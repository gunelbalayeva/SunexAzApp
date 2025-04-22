//
//  NetworkService.swift
//  SunexAzApp
//
//  Created by User on 12.04.25.
//
import UIKit
class NetworkService {
    
    func login(with email: String, password: String, completion: @escaping (Result<LoginModel.Response, NetworkError>) -> Void) {
        
        let body = LoginModel.Request(email: email, password: password)
        
        let request = requestBuilder(
            with: "https://panel.sunex.az/api/account/login",
            method: .post,
            body: body
        )
        if let mockResponse = JSONMockData().loadMockLoginResponse() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                completion(.success(mockResponse))
            }
        } else {
            completion(.failure(NetworkError(message: "Mock fayl tapılmadı.")))
        }
        
        //        let task = URLSession.shared.dataTask(with: request) { data, response, error in
        //
        //            if let error = error {
        //                print("Something went wrong in login service: \(error)")
        //                completion(.failure(.init(message: error.localizedDescription)))
        //                return
        //            }
        //
        //            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
        //
        //            if let data = data {
        //                do {
        //                    if (200..<300).contains(statusCode) {
        //                        let dataResponse = try JSONDecoder().decode(LoginModel.Response.self, from: data)
        //                        completion(.success(dataResponse))
        //                    } else {
        //                        let error = try JSONDecoder().decode(NetworkError.self, from: data)
        //                        completion(.failure(error))
        //                    }
        //                } catch {
        //                    print("Something went wrong in decoding: \(error)")
        //                    completion(.failure(.init(message: error.localizedDescription)))
        //                }
        //            }
        //        }
        //        task.resume()
    }
    
    
    func register(with request: RegisterModel.Request, completion: @escaping (Result<RegisterModel.Response, NetworkError>) -> Void) {
        let urlRequest = requestBuilder(
            with: "https://panel.sunex.az/api/account/register",
            method: .post,
            body: request
        )
        if let mockResponse = JSONMockData().loadMockRegisterResponse() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                completion(.success(mockResponse))
            }
        } else {
            completion(.failure(NetworkError(message: "Mock fayl tapılmadı.")))
        }
        //        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
        //            if let error = error {
        //                print("Something went wrong in login service... \(error)")
        //                completion(.failure(NetworkError(message: error.localizedDescription)))
        //                return
        //            }
        //            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? .zero
        //
        //            if let data = data {
        //                do {
        //                    if (200..<300).contains(statusCode) {
        //                        let dataResponse = try JSONDecoder().decode(RegisterModel.Response.self, from: data)
        //                        completion(.success(dataResponse))
        //                    } else {
        //                        let error = try JSONDecoder().decode(NetworkError.self, from: data)
        //                        completion(.failure(error))
        //                    }
        //                } catch {
        //                    print("Something went wrong in decoding... \(error)")
        //                    completion(.failure(NetworkError(message: error.localizedDescription)))
        //                }
        //            }
        //        }
        //        task.resume()
    }
    
    func getDashboard(token: String, completion: @escaping (Result<DashboardModel.Response, NetworkError>) -> Void) {
        var request = URLRequest(url: URL(string: "https://panel.sunex.az/api/account/dashboard")!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        if let mockResponse = JSONMockData().loadMockDashboardResponse() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                completion(.success(mockResponse))
            }
        } else {
            completion(.failure(NetworkError(message: "Mock fayl tapılmadı.")))
        }
        //        let task = URLSession.shared.dataTask(with: request) { data, response, error in
        //            if let error = error {
        //                print("Dashboard error: \(error)")
        //                completion(.failure(NetworkError(message: error.localizedDescription)))
        //                return
        //            }
        //
        //            guard let data = data else {
        //                completion(.failure(NetworkError(message: "Boş cavab gəldi.")))
        //                return
        //            }
        //
        //            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
        //
        //            do {
        //                if (200..<300).contains(statusCode) {
        //                    let dashboardData = try JSONDecoder().decode(DashboardModel.Response.self, from: data)
        //                    completion(.success(dashboardData))
        //                } else {
        //                    let errorResponse = try JSONDecoder().decode(NetworkError.self, from: data)
        //                    completion(.failure(errorResponse))
        //                }
        //            } catch {
        //                completion(.failure(NetworkError(message: error.localizedDescription)))
        //            }
        //        }
        //        task.resume()
    }
    
    func forgotPassword(with email: String, completion: @escaping (Result<ForgotPasswordResponse, Error>) -> Void) {
        var request = URLRequest(url: URL(string: "https://panel.sunex.az/api/account/forgotpassword")!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let token = UserDefaults.standard.string(forKey: "accessToken") {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        if let mockResponse = JSONMockData().loadMockForgotPasswordResponse() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                completion(.success(mockResponse))
            }
        } else {
            completion(.failure(NetworkError(message: "Mock fayl tapılmadı.")))
        }
    }

    
    private func requestBuilder(with url:String, method:HTTPMethod, body :Encodable?) -> URLRequest{
        let url = URL(string: url)!
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if let body = body {
            let bodyData = try? JSONEncoder().encode(body)
            request.httpBody = bodyData
        }
        return request
    }
}
struct NetworkError: Error, Decodable {
    let message: String
    
    init(message: String) {
        self.message = message
    }
}

struct ErrorModel:Decodable{
    let message:String
}
enum HTTPMethod :String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

