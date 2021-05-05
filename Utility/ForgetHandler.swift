//
//  ForgetHandler.swift
//  Spine
//
//  Created by apple on 07/01/21.
//

import Combine
import Alamofire

class ForgetHandler: APIHandler {
    
    @Published var woofResponse: ForgetModel?
    @Published var isLoading = false
  
   
            
    func getForget(email:String) {
        isLoading = true
      
        let url = appConstants.kBASE_URL + appConstants.kforgetPassword
        let user = "devpankaj"
        let password = "devpankaj"
        let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers: HTTPHeaders = ["Authorization": "Basic \(base64Credentials)", "X-API-KEY": "123run", "Content-Type": "application/x-www-form-urlencoded"]
        print(headers)
        
        let params:[String:Any]? = ["email": email]
        print("param",params)
        AF.request(url, method: .post, parameters: params , encoding: URLEncoding.default, headers: headers).responseDecodable { [weak self] (response: DataResponse<ForgetModel, AFError>) in
            guard let weakSelf = self else { return }
            
            guard let response = weakSelf.handleResponse(response) as? ForgetModel else {
                weakSelf.isLoading = false
                return
            }
                            
            weakSelf.isLoading = false
            weakSelf.woofResponse = response
        }
    }
    
}

