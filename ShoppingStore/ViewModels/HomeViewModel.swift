//
//  HomeViewModel.swift
//  ShoppingStore
//
//  Created by Usitha Kodithuwakku Arachchi on 2024-03-21.
//

import Foundation
import SwiftUI

class HomeViewModal: ObservableObject {
    
    @Published var username : String = ""
    @Published var password : String = ""
    @Published var showError : Bool = false
   

    @Published var success: Bool = false
    @Published var errorMessage: String = ""
    
    func validateUser(completion: @escaping () -> Void) {
        
        
        
            if username.isEmpty || password.isEmpty {
                        showError = true
                        errorMessage = "Please enter username and password"
                        completion()
                        return
                    }
        
        
            guard let url = URL(string: "http://127.0.0.1:8000/login") else {
                showError = true
                errorMessage = "Invalid URL"
                completion()
                return
            }

            let body: [String: String] = [
                "username": username,
                "password": password
            ]
            guard let jsonData = try? JSONSerialization.data(withJSONObject: body) else {
                showError = true
                errorMessage = "Error creating request data"
                completion()
                return
            }

            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData

            // Perform the network request
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    if let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        if let errorResponse = jsonResponse["error"] as? String {
                            if errorResponse == "Invalid credentials" {
                                self.showError = true
                                self.errorMessage = "Login failed: Invalid credentials"
                            } else {
                                self.showError = true
                                self.errorMessage = "Login failed: \(errorResponse)"
                            }
                        } else if let status = jsonResponse["status"] as? String, status == "login successfull" {
                            self.success = true
                            self.showError = false
                        } else {
                            self.showError = true
                            self.errorMessage = "Login failed: Unknown error"
                        }
                    } else {
                        self.showError = true
                        self.errorMessage = "Invalid response from server"
                    }
                } else {
                    self.showError = true
                    self.errorMessage = "Error connecting to server"
                }
                completion()
            }
        }.resume()
        
    }
}


