//
//  PastEvemntHandler.swift
//  Spine
//
//  Created by Aashita Tyagi on 06/04/21.
//

import Foundation
import Combine
import Alamofire


class PastEventHandler: APIHandler{
    
    @Published var pastEventDataResponse: PastEventModel?
    @Published var isLoading = false
   
    

    func getPastEventData() {
        isLoading = true
        
        let user = "devpankaj"
        let password = "devpankaj"
        let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers: HTTPHeaders = ["Authorization": "Basic \(base64Credentials)", "X-API-KEY": "123run", "Content-Type": "application/x-www-form-urlencoded"]
        print(headers)
            let userId = UserDefaults.standard.string(forKey: "user_id") ?? ""
           
   
//        http://162.214.165.52/~pirituc5/apisecure/events/getOnlineUsersEventsList/page/per_page/your_user_id

        
        let url = appConstants.kBASE_URL + "events/getUserGoingEventsList/1/100/" + userId + "/1"
        
        
        AF.request(url, method: .get, parameters: nil , encoding: URLEncoding.default, headers: headers).responseDecodable { [weak self] (response: DataResponse<PastEventModel, AFError>) in
            guard let weakSelf = self else { return }
            
            guard let response = weakSelf.handleResponse(response) as? PastEventModel else {
                weakSelf.isLoading = false
                return
            }
                            
            weakSelf.isLoading = false
            weakSelf.pastEventDataResponse = response
           
            }
        }

}


