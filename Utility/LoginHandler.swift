//
//  AuthenticationHandler.swift
//  LoginWithSwiftUIDemo
//
//  Created by Lawrence Tan on 4/4/20.
//  Copyright © 2020 Lawrence Tan. All rights reserved.
//

import Combine
import Alamofire

class LoginHandler: APIHandler {
    
    @Published var woofResponse: LoginModel?
    @Published var isLoading = false
    @Published var userId = ""
    
   
            
    func getLogin(email:String, password1:String) {
        isLoading = true

        let url = appConstants.kBASE_URL + appConstants.kloginUser
        let user = "devpankaj"
        let password = "devpankaj"
        let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers: HTTPHeaders = ["Authorization": "Basic \(base64Credentials)", "X-API-KEY": "123run", "Content-Type": "application/x-www-form-urlencoded"]
        print(headers)
        
        let params:[String:Any]? = ["email": email, "password":password1, "notify_device_token":"123456", "notify_device_type": "IOS"]
        print("param",params as Any)
        AF.request(url, method: .post, parameters: params , encoding: URLEncoding.default, headers: headers).responseDecodable { [weak self] (response: DataResponse<LoginModel, AFError>) in
            guard let weakSelf = self else { return }
            
            guard let response = weakSelf.handleResponse(response) as? LoginModel else {
                weakSelf.isLoading = false
                return
            }
                            
            weakSelf.isLoading = false
            weakSelf.woofResponse = response
            self?.userId = (response.data?.users_id)!
            UserDefaults.standard.setValue(self?.userId, forKeyPath: "user_id")
            
        }
    }
    
}
