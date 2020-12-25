//
//  RegisterViewModel.swift
//  Spine
//
//  Created by apple on 24/12/20.
//

import Foundation
import SwiftUI
import Combine
import Alamofire

public class RegisterViewModel: ObservableObject {
    
    @Published var registers: Registers = [RegisterModel]()
    
    func shuffle() {
        self.registers = self.registers.shuffled()
    }
    
    func load() {
        
      
        
//        guard let url = URL(string: "http://wiesoftware.com/spine/apisecure/login/registerUsers") else { return }
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            do {
//                guard let data = data else { return }
//                let registers = try JSONDecoder().decode(Registers.self, from: data)
//
//                DispatchQueue.main.async {
//                    self.registers = registers
//                    print(self.registers)
//                }
//            } catch {
//                print("Failed To decode: ", error)
//            }
//            }.resume()
//    }
        
        let email = "s11ss@gmail.com"
        let name = "s"
        let town = "s"
        let password = "123456"
        let user_ip = "198.168.1.1"
        let user_latitude = "28.2356"
        let user_longitude = "77.2356"
        
        let params: [String:Any]? = ["email":email, "name":name, "town":town, "password":password, "user_ip": user_ip, "user_latitude":user_latitude, "user_longitude":user_longitude]
                print(params!)

                ServiceClassMethods.sharedInstance.AlamoRequestNew(method: .post, serviceString: appConstants.kregisterUsers, parameters: params) { (dict) in

                    print(dict)
                    print("response",dict)
                    let dataResult = dict as! Dictionary<String,Any>
//                    self.registers = dict

                    let message = dataResult["message"] as! String
                    let status = dataResult["status"]! as! Int64
                    print("status",status)
                    if status == 1{
//                    self.navigationController?.popViewController(animated: true)
//                    self.dismiss(animated: true, completion: nil)
                        }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.0, execute: {
//                        self.alert(message: message)
                    })
                }
        

   
    }
    
}

