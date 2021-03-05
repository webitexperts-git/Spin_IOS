//
//  PostPreviewHandler.swift
//  Spine
//
//  Created by Aashita Tyagi on 25/02/21.
//

import Foundation
import Combine
import Alamofire


class PostPreviewHandler: APIHandler{
    
    @Published var postDataResponse: PostPreviewModel?
    @Published var isLoading = false
            
//    http://wiesoftware.com/spine/apisecure/post/addUserPost
        
func getPostData() {
    isLoading = true
    
    let user = "devpankaj"
    let password = "devpankaj"
    let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
    let base64Credentials = credentialData.base64EncodedString(options: [])
    let headers: HTTPHeaders = ["Authorization": "Basic \(base64Credentials)", "X-API-KEY": "123run", "Content-Type": "application/x-www-form-urlencoded"]
    print(headers)
        let userId = UserDefaults.standard.string(forKey: "user_id")!
        let post = UserDefaults.standard.object(forKey: "post") ?? ""
//        let color = UserDefaults.standard.color(forKey: "color")!
   
//    print("color", color)
        let hash = UserDefaults.standard.object(forKey: "hash") ?? ""
    let url = appConstants.kBASE_URL + "/post/addUserPost"

    let params:[String:Any] = ["user_id": userId, "type": "0", "title" : post, "hashtag_ids" : hash, "post_backround_color_id": "#B89A8A", "multiplity": "0"]
    
    AF.request(url, method: .post, parameters: params , encoding: URLEncoding.default, headers: headers).responseDecodable { [weak self] (response: DataResponse<PostPreviewModel, AFError>) in
        guard let weakSelf = self else { return }
        
        guard let response = weakSelf.handleResponse(response) as? PostPreviewModel else {
            weakSelf.isLoading = false
            return
        }
                        
        weakSelf.isLoading = false
        weakSelf.postDataResponse = response
        }
    }
}


