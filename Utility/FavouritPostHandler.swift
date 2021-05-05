//
//  FollowersHandler.swift
//  Spine
//
//  Created by apple on 18/01/21.
//

import Foundation
import Combine
import Alamofire


class FavouritPostHandler: APIHandler{

    @Published var favouritPostDataResponse: FavouritPostModel?
    @Published var isLoading = false
   

    func getFavouriteData(id: String) {
    isLoading = true

    let user = "devpankaj"
    let password = "devpankaj"
    let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
    let base64Credentials = credentialData.base64EncodedString(options: [])
    let headers: HTTPHeaders = ["Authorization": "Basic \(base64Credentials)", "X-API-KEY": "123run", "Content-Type": "application/x-www-form-urlencoded"]
    print(headers)
//    http://wiesoftware.com/spine/apisecure/post/spinePostLike/20/59
//    let userId = UserDefaults.standard.string(forKey: "user_id")!
    let url = appConstants.kBASE_URL + "post/spinePostLike/20/59"

//    let params:[String:Any] = ["userId": userId]

    AF.request(url, method: .get, parameters: nil , encoding: URLEncoding.default, headers: headers).responseDecodable { [weak self] (response: DataResponse<FavouritPostModel, AFError>) in
        guard let weakSelf = self else { return }

        guard let response = weakSelf.handleResponse(response) as? FavouritPostModel else {
            weakSelf.isLoading = false
            return
        }

        weakSelf.isLoading = false
        weakSelf.favouritPostDataResponse = response
        }
    }
    
}

