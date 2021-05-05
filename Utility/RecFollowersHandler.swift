//
//  RecFollowersHandler.swift
//  Spine
//
//  Created by Aashita Tyagi on 19/02/21.
//

import Combine
import Alamofire


class RecFollowersHandler: APIHandler{
    
    @Published var recFollowersDataResponse: RecFollowersModel?
    @Published var isLoading = false
            
//    http://wiesoftware.com/spine/apisecure/follow/allUserList/1/10/59
        
func getRecFollowersData() {
    isLoading = true
    
    let user = "devpankaj"
    let password = "devpankaj"
    let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
    let base64Credentials = credentialData.base64EncodedString(options: [])
    let headers: HTTPHeaders = ["Authorization": "Basic \(base64Credentials)", "X-API-KEY": "123run", "Content-Type": "application/x-www-form-urlencoded"]
    print(headers)
        let userId = UserDefaults.standard.string(forKey: "user_id") ?? ""
    let url = appConstants.kBASE_URL + "/follow/recommendedFollowersListByCategories/1/10/" + userId
    
   

//    let params:[String:Any] = ["userId": userId, "spine_post_id": "20", "comment_id" : "0", "comment" : "abcd"]
    
    AF.request(url, method: .get, parameters: nil , encoding: URLEncoding.default, headers: headers).responseDecodable { [weak self] (response: DataResponse<RecFollowersModel, AFError>) in
        guard let weakSelf = self else { return }
        
        guard let response = weakSelf.handleResponse(response) as? RecFollowersModel else {
            weakSelf.isLoading = false
            return
        }
                        
        weakSelf.isLoading = false
        weakSelf.recFollowersDataResponse = response
        }
    }
}


