//
//  ForgetViewModel.swift
//  Spine
//
//  Created by apple on 07/01/21.
//

import Foundation
import SwiftUI
import Combine
import Alamofire


public class ForgetViewModel: ObservableObject, Identifiable {
    
    @Published var isLoggedIn = false
    @Published var isLoading = false
    @Published var email = ""
    @Published var shouldNavigate = false
    
    @State var alertMsg = ""
    
    @State var showAlert = false
    
    var alert: Alert {
        Alert(title: Text(""), message: Text(alertMsg), dismissButton: .default(Text("OK")))
    }
    private var disposables: Set<AnyCancellable> = []
    
    var forgetHandler = ForgetHandler()
    
    @Published var woofUrl = false
    
    private var isLoadingPublisher: AnyPublisher<Bool, Never> {
        forgetHandler.$isLoading
            .receive(on: RunLoop.main)
            .map { $0 }
            .eraseToAnyPublisher()
    }
    
    private var isAuthenticatedPublisher: AnyPublisher<Bool, Never> {
        forgetHandler.$woofResponse
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
    
    func getForget() {
        if(self.isValidInputs()){
        forgetHandler.getForget(email: email)
        }
    }
    
    fileprivate func isValidInputs() -> Bool {
        
        if self.email == "" {
            self.alertMsg = "Email can't be blank."
            self.showAlert.toggle()
            return false
        } else if !self.email.isValidEmail {
            self.alertMsg = "Email is not valid."
            self.showAlert.toggle()
            return false
        }
  
        
        return true
    }

  
}
    



