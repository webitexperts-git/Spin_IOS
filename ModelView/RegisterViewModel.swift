//
//  RegisterViewModel.swift
//  Spine
//
//  Created by apple on 07/01/21.
//

import Foundation
import SwiftUI
import Combine
import Alamofire
import NetworkExtension

public class RegisterViewModel: ObservableObject, Identifiable {
    
    @Published var email = ""
    @Published var password = ""
    @Published var name = ""
    @Published var town = ""
    @Published var user_ip = ""
    @Published var user_latitude = ""
    @Published var user_longitude = ""
//    @Published var verification_pin = ""
//    @Published var data = [RegisterModel.Data]()
    @Published var data:[RegisterModel.Data] = []
    @Published var verificationPin = ""
    @Published var userId = ""
    @Published var isLoggedIn = false
    @Published var isLoading = false
    
    @Published var shouldNavigate = false
    
    @State var alertMsg = ""
    
    @State var showAlert = false
    
    var alert: Alert {
        Alert(title: Text(""), message: Text(alertMsg), dismissButton: .default(Text("OK")))
    }
    private var disposables: Set<AnyCancellable> = []
    
    var registerHandler = RegisterHandler()
    
    @Published var woofUrl = false
    
    private var isLoadingPublisher: AnyPublisher<Bool, Never> {
        registerHandler.$isLoading
            .receive(on: RunLoop.main)
            .map { $0 }
            .eraseToAnyPublisher()
    }
    
    private var isAuthenticatedPublisher: AnyPublisher<Bool, Never> {
        registerHandler.$woofResponse1
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {
                    return false
                }
                
                return response.status ?? false
        }
        .eraseToAnyPublisher()
    }
    
    
    private var isDataPublisher: AnyPublisher<String, Never> {
        registerHandler.$woofResponse1
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {
                    return ""
            }

                return (response.data?.verification_pin) ?? ""
    }
        .eraseToAnyPublisher()
    }
    
    private var isuserPublisher: AnyPublisher<String, Never> {
        registerHandler.$woofResponse1
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {
                    return ""
            }

                return (response.data?.users_id)!
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
        
        
        isDataPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.verificationPin, on: self)
            .store(in: &disposables)
            print("Register",verificationPin)
        
        isuserPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.userId, on: self)
            .store(in: &disposables)
            print("Register",userId)
    }
    
    
    func getIPAddress(){
           var address: String = ""
        var ifaddr: UnsafeMutablePointer<ifaddrs>? = nil
           if getifaddrs(&ifaddr) == 0 {
               var ptr = ifaddr
               while ptr != nil {
                   defer { ptr = ptr?.pointee.ifa_next }
                   
                   let interface = ptr?.pointee
                   let addrFamily = interface?.ifa_addr.pointee.sa_family
                   if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {
                       
                         if let name: String? = String(cString: (interface?.ifa_name)!), name == "en0" {
                           var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                           getnameinfo(interface?.ifa_addr, socklen_t((interface?.ifa_addr.pointee.sa_len)!), &hostname, socklen_t(hostname.count), nil, socklen_t(0), NI_NUMERICHOST)
                           address = String(cString: hostname)
                           print(address)
                            user_ip = address
                        }
                   }
               }
               freeifaddrs(ifaddr)
           }
//            return address
       }
    
    func getRagistration() {
            user_latitude = "27.1254"
            user_longitude = "77.1245"
            user_ip = "198.168.1.1"
            registerHandler.getRagistration(email: email, password: password, name:name, town:town, user_ip:user_ip, user_latitude:user_latitude, user_longitude:user_longitude)
       
    }
    
    
    
    
    fileprivate func isValidInputs() -> Bool {
        
        if self.name == "" {
            self.alertMsg = "Username can't be blank."
            self.showAlert.toggle()
            return false
        }
        else if self.email == "" {
            self.alertMsg = "Email can't be blank."
            self.showAlert.toggle()
            return false
        }
            else if !self.email.isValidEmail {
            self.alertMsg = "Email is not valid."
            self.showAlert.toggle()
            return false
        }
        else if self.password == "" {
            self.alertMsg = "Password can't be blank."
            self.showAlert.toggle()
            return false
        } else if self.town == "" {
            self.alertMsg = "town can't be blank."
            self.showAlert.toggle()
            return false
        }
    //    else if !(self.password.isValidPassword) {
    //        self.alertMsg = "Please enter valid password"
    //        self.showAlert.toggle()
    //        return false
    //    }
        
        return true
    }

   
}
    




