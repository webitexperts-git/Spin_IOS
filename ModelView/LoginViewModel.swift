//
//  LoginViewModel.swift
//  Spine
//
//  Created by apple on 14/12/20.
//

import Foundation
import SwiftUI
import Combine


public class LoginViewModel: ObservableObject {
    
    @Published var logins: Logins = [LoginModel]()
    
    func shuffle() {
        self.logins = self.logins.shuffled()
    }
    
    func load() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos/") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                guard let data = data else { return }
                let logins = try JSONDecoder().decode(Logins.self, from: data)
               
                DispatchQueue.main.async {
                    self.logins = logins
                    print(self.logins)
                }
            } catch {
                print("Failed To decode: ", error)
            }
            }.resume()
    }
}


