//
//  StoriesHandler.swift
//  Spine
//
//  Created by apple on 18/01/21.
//

import Foundation
import Combine
import Alamofire

class StoriesHandler: APIHandler{
    
    @Published var storiesDataResponse: StoriesModel?
    @Published var isLoading = false
            
   
        
func getStoriesData() {
    isLoading = true
    
    let user = "devpankaj"
    let password = "devpankaj"
    let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
    let base64Credentials = credentialData.base64EncodedString(options: [])
    let headers: HTTPHeaders = ["Authorization": "Basic \(base64Credentials)", "X-API-KEY": "123run", "Content-Type": "application/x-www-form-urlencoded"]
    print(headers)
    
    let url = appConstants.kBASE_URL + "stories/getFollowingUsersStorieList/1/10/your_user_id"
    let params:[String:Any] = [:]
    
    AF.request(url, method: .post, parameters: params , encoding: URLEncoding.default, headers: headers).responseDecodable { [weak self] (response: DataResponse<HomeImpulseModel, AFError>) in
        guard let weakSelf = self else { return }
        
        guard let response = weakSelf.handleResponse(response) as? HomeImpulseModel else {
            weakSelf.isLoading = false
            return
        }
                        
        weakSelf.isLoading = false
        weakSelf.storiesDataResponse = response
        }
    }
}

