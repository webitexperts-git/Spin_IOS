//
//  UserDetailHandler.swift
//  Spine
//
//  Created by Aashita Tyagi on 31/03/21.
//

import Foundation
import Combine
import Alamofire


class UserDetailHandler: APIHandler{
    
    @Published var userDetailResponse: UserDetailModel?
    @Published var isLoading = false
            
   
        
    func getUserDetailData() {
    isLoading = true
    
    let user = "devpankaj"
    let password = "devpankaj"
    let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
    let base64Credentials = credentialData.base64EncodedString(options: [])
    let headers: HTTPHeaders = ["Authorization": "Basic \(base64Credentials)", "X-API-KEY": "123run", "Content-Type": "application/x-www-form-urlencoded"]
    print(headers)
        
//        https://seobywebitindia.com/dev/spine/apisecure/userDetails/59
    
    let userId = UserDefaults.standard.string(forKey: "user_id") ?? ""
    
    let url = appConstants.kBASE_URL + appConstants.kuserDetails + userId

//    let params:[String:Any] = ["userId": userId]
    
    AF.request(url, method: .get, parameters: nil , encoding: URLEncoding.default, headers: headers).responseDecodable { [weak self] (response: DataResponse<UserDetailModel, AFError>) in
        guard let weakSelf = self else { return }
        
        guard let response = weakSelf.handleResponse(response) as? UserDetailModel else {
            weakSelf.isLoading = false
            return
        }
                        
        weakSelf.isLoading = false
        weakSelf.userDetailResponse = response
        }
    }
}

