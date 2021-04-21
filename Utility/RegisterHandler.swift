//
//  RegisterHandler.swift
//  Spine
//
//  Created by apple on 07/01/21.
//

import Foundation
import Alamofire
import Reachability
import PKHUD


class RegisterHandler: APIHandler {
    
    @Published var woofResponse1: RegisterModel?
    @Published var isLoading = false
    
    
    func getRagistration(email:String, password:String, name:String, town:String, user_ip:String, user_latitude:String, user_longitude:String) {
        isLoading = true
      
        let url = appConstants.kBASE_URL + appConstants.kregisterUsers
        let user = "devpankaj"
        let password = "devpankaj"
        let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers: HTTPHeaders = ["Authorization": "Basic \(base64Credentials)", "X-API-KEY": "123run", "Content-Type": "application/x-www-form-urlencoded"]
        print(headers)
        
        let params:[String:Any]? = ["email": email, "password":password, "name":name, "town": town, "user_ip":user_ip, "user_latitude": user_latitude, "user_longitude": user_longitude]
//        print("param",params)
        AF.request(url, method: .post, parameters: params , encoding: URLEncoding.default, headers: headers).responseDecodable { [weak self] (response: DataResponse<RegisterModel, AFError>) in
            guard let weakSelf = self else { return }
            
            guard let response = weakSelf.handleResponse(response) as? RegisterModel else {
                weakSelf.isLoading = false
                return
            }
                            
            weakSelf.isLoading = false
            weakSelf.woofResponse1 = response
            
            if(weakSelf.woofResponse1?.status != true){
                weakSelf.alertAction(message:response.message!)
            }
        }
    }
    
}


