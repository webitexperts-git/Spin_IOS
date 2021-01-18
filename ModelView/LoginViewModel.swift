//
//  LoginViewModel.swift
//  Spine
//
//  Created by apple on 14/12/20.
//

import Foundation
import SwiftUI
import Combine
import Alamofire


public class LoginViewModel: ObservableObject, Identifiable {
    

    @Published var email = ""
    @Published var password = ""
    
    @Published var isLoggedIn = false
    @Published var isLoading = false
    
    @Published var shouldNavigate = false
    
    @State var alertMsg = ""
    
    @State var showAlert = false
    
    var alert: Alert {
        Alert(title: Text(""), message: Text(alertMsg), dismissButton: .default(Text("OK")))
    }
    private var disposables: Set<AnyCancellable> = []
    
    var loginHandler = LoginHandler()
    @Published var data:[Data] = []
    @Published var woofUrl = false
    @Published var image = String()
    
    private var isLoadingPublisher: AnyPublisher<Bool, Never> {
        loginHandler.$isLoading
            .receive(on: RunLoop.main)
            .map { $0 }
            .eraseToAnyPublisher()
    }
    
    private var isAuthenticatedPublisher: AnyPublisher<Bool, Never> {
        loginHandler.$woofResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {
                    return false
                }
                return response.status ?? false
        }
        .eraseToAnyPublisher()
    }
    
    init() {
        isLoadingPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.isLoading, on: self)
            .store(in: &disposables)
        
        isAuthenticatedPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.woofUrl, on: self)
            .store(in: &disposables)
            print(woofUrl)
    }
    
    func getLogin() {
     
        loginHandler.getLogin(email: email, password1: password)
       
    }

}
    


