//
//  HomeImpulseHandler.swift
//  Spine
//
//  Created by apple on 18/01/21.
//

import Foundation
import Combine
import Alamofire


class HomeImpulseHandler: APIHandler{
    
   
    @Published var homeImpulseDataResponse: HomeImpulseModel?
    @Published var isLoading = false
            
   
        
func getHomeImpulseData() {
    isLoading = true
    
    let user = "devpankaj"
    let password = "devpankaj"
    let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
    let base64Credentials = credentialData.base64EncodedString(options: [])
    let headers: HTTPHeaders = ["Authorization": "Basic \(base64Credentials)", "X-API-KEY": "123run", "Content-Type": "application/x-www-form-urlencoded"]
    print(headers)
    
    let url = "http://wiesoftware.com/spine/apisecure/impluse/impluseList/1/10/64"
    
    AF.request(url, method: .get, parameters: nil , encoding: URLEncoding.default, headers: headers).responseDecodable { [weak self] (response: DataResponse<HomeImpulseModel, AFError>) in
        guard let weakSelf = self else { return }
        
        guard let response = weakSelf.handleResponse(response) as? HomeImpulseModel else {
            weakSelf.isLoading = false
            return
        }
                        
        weakSelf.isLoading = false
        weakSelf.homeImpulseDataResponse = response
        }
    }
}

