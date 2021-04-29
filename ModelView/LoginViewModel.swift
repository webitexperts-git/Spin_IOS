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
            print("xxxxx",woofUrl)
    }
    
    func getLogin() {
       
        loginHandler.getLogin(email: email, password1: password)
      
    }
    
    func getSocialLogin() {
        
        loginHandler.getSocialLogin()
      
    }

}


extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1) {
        var newHex: String
        let string : String = hex
        let characters = Array(string)
        if hex == "#rt5465"{
            newHex = "#B89A8A"
           
        }else if hex == "0"{
            newHex = "#B89A8A"
           
        }
        else if characters[0] != "#"{
            newHex = "#B89A8A"
           
        }
        else{
            newHex = hex
           
        }
        
        print("newHex", newHex)
        
        assert(newHex[newHex.startIndex] == "#", "Expected hex string of format #RRGGBB")
        
        let scanner = Scanner(string: newHex)
        scanner.scanLocation = 1  // skip #
        
        var rgb: UInt32 = 0
        scanner.scanHexInt32(&rgb)
        
        self.init(
            red:   CGFloat((rgb & 0xFF0000) >> 16)/255.0,
            green: CGFloat((rgb &   0xFF00) >>  8)/255.0,
            blue:  CGFloat((rgb &     0xFF)      )/255.0,
            alpha: alpha)
    }
    
    
    
}

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}

extension UITextField {
  func setBottomBorder() {
    self.borderStyle = .none
    self.layer.backgroundColor = UIColor.white.cgColor

    self.layer.masksToBounds = false
    self.layer.shadowColor = UIColor.gray.cgColor
    self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
    self.layer.shadowOpacity = 1.0
    self.layer.shadowRadius = 0.0
  }

}


//extension UIColor {
//    public convenience init?(hex: String) {
//        let r, g, b, a: CGFloat
//
//        if hex.hasPrefix("#") {
//            let start = hex.index(hex.startIndex, offsetBy: 1)
//            let hexColor = String(hex[start...])
//
//            if hexColor.count == 6 {
//                let scanner = Scanner(string: hexColor)
//                var hexNumber: UInt64 = 0
//
//                if scanner.scanHexInt64(&hexNumber) {
//                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
//                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
//                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
//                    a = CGFloat(hexNumber & 0x000000ff) / 255
//
//                    self.init(red: r, green: g, blue: b, alpha: a)
//                    return
//                }
//            }
//        }
//
//        return nil
//    }
//}
