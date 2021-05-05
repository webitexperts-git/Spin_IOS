//
//  EmailVerificationHandler.swift
//  Spine
//
//  Created by Aashita Tyagi on 03/03/21.
//

import Foundation
import Combine
import Alamofire


class EmailVerificationHandler: APIHandler{
    
    @Published var emailVerificationDataResponse: EmailVerificationModel?
    @Published var isLoading = false
            
//    http://wiesoftware.com/spine/apisecure/post/addUserPost
        
    func getEmailVerificationData(userId: String) {
    isLoading = true
    
    let user = "devpankaj"
    let password = "devpankaj"
    let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
    let base64Credentials = credentialData.base64EncodedString(options: [])
    let headers: HTTPHeaders = ["Authorization": "Basic \(base64Credentials)", "X-API-KEY": "123run", "Content-Type": "application/x-www-form-urlencoded"]
    print(headers)
//        let userId = UserDefaults.standard.string(forKey: "user_id")!
       
//    http://wiesoftware.com/spine/apisecure/events/getUsersEventsList/1/10/212
    print("userId",userId)
    let url = appConstants.kBASE_URL + "/login/accountVerify/" + userId

    
    AF.request(url, method: .get, parameters: nil , encoding: URLEncoding.default, headers: headers).responseDecodable { [weak self] (response: DataResponse<EmailVerificationModel, AFError>) in
        guard let weakSelf = self else { return }
        
        guard let response = weakSelf.handleResponse(response) as? EmailVerificationModel else {
            weakSelf.isLoading = false
            return
        }
                        
        weakSelf.isLoading = false
        weakSelf.emailVerificationDataResponse = response
        }
    }
}


