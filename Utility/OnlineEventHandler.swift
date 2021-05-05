//
//  OnlineEventHandler.swift
//  Spine
//
//  Created by Aashita Tyagi on 03/04/21.
//

import SwiftUI
import Combine
import Alamofire


class OnlineEventHandler: APIHandler{
    
    @Published var onlineEventDataResponse: OnlineEventModel?
    @Published var isLoading = false
   
    

    func getOnlineEventData() {
        isLoading = true
        
        let user = "devpankaj"
        let password = "devpankaj"
        let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers: HTTPHeaders = ["Authorization": "Basic \(base64Credentials)", "X-API-KEY": "123run", "Content-Type": "application/x-www-form-urlencoded"]
        print(headers)
            let userId = UserDefaults.standard.string(forKey: "user_id") ?? ""
           
   
//        http://162.214.165.52/~pirituc5/apisecure/events/getOnlineUsersEventsList/page/per_page/your_user_id

        
        let url = appConstants.kBASE_URL + "events/getOnlineUsersEventsList/1/100/" + userId
        
        
        AF.request(url, method: .get, parameters: nil , encoding: URLEncoding.default, headers: headers).responseDecodable { [weak self] (response: DataResponse<OnlineEventModel, AFError>) in
            guard let weakSelf = self else { return }
            
            guard let response = weakSelf.handleResponse(response) as? OnlineEventModel else {
                weakSelf.isLoading = false
                return
            }
                            
            weakSelf.isLoading = false
            weakSelf.onlineEventDataResponse = response
           
            }
        }

}


