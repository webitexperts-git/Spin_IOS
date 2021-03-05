//
//  FollowingHandler.swift
//  Spine
//
//  Created by Aashita Tyagi on 08/02/21.
//

import Foundation
import Combine
import Alamofire


class FollowingHandler: APIHandler{
    
    @Published var followingDataResponse: FollowingModel?
    @Published var isLoading = false
            
   
        
func getFollowingData() {
    isLoading = true
    
    let user = "devpankaj"
    let password = "devpankaj"
    let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
    let base64Credentials = credentialData.base64EncodedString(options: [])
    let headers: HTTPHeaders = ["Authorization": "Basic \(base64Credentials)", "X-API-KEY": "123run", "Content-Type": "application/x-www-form-urlencoded"]
    print(headers)
        let userId = UserDefaults.standard.string(forKey: "user_id")!
    let url = appConstants.kBASE_URL + "stories/getFollowingUsersStorieList/1/100/" + userId
    

//    let params:[String:Any] = ["userId": userId]
    
    AF.request(url, method: .get, parameters: nil , encoding: URLEncoding.default, headers: headers).responseDecodable { [weak self] (response: DataResponse<FollowingModel, AFError>) in
        guard let weakSelf = self else { return }
        
        guard let response = weakSelf.handleResponse(response) as? FollowingModel else {
            weakSelf.isLoading = false
            return
        }
                        
        weakSelf.isLoading = false
        weakSelf.followingDataResponse = response
        }
    }
}

