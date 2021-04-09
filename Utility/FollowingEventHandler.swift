//
//  FollowingEventHandler.swift
//  Spine
//
//  Created by Aashita Tyagi on 06/04/21.
//

import Foundation
import Combine
import Alamofire


class FollowingEventHandler: APIHandler{
    
    @Published var followingEventDataResponse: FollowingEventModel?
    @Published var isLoading = false
   
    

    func getFollowingEventData() {
        isLoading = true
        
        let user = "devpankaj"
        let password = "devpankaj"
        let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers: HTTPHeaders = ["Authorization": "Basic \(base64Credentials)", "X-API-KEY": "123run", "Content-Type": "application/x-www-form-urlencoded"]
        print(headers)
            let userId = UserDefaults.standard.string(forKey: "user_id") ?? ""
           
   
//        http://162.214.165.52/~pirituc5/apisecure/events/getOnlineUsersEventsList/page/per_page/your_user_id

        
        let url = appConstants.kBASE_URL + "events/getUsersEventsList/1/100/" + userId
        
        
        AF.request(url, method: .get, parameters: nil , encoding: URLEncoding.default, headers: headers).responseDecodable { [weak self] (response: DataResponse<FollowingEventModel, AFError>) in
            guard let weakSelf = self else { return }
            
            guard let response = weakSelf.handleResponse(response) as? FollowingEventModel else {
                weakSelf.isLoading = false
                return
            }
                            
            weakSelf.isLoading = false
            weakSelf.followingEventDataResponse = response
           
            }
        }

}


