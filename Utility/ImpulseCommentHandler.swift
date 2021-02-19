//
//  ImpulseCommentHandler.swift
//  Spine
//
//  Created by Aashita Tyagi on 17/02/21.
//

import Foundation
import Combine
import Alamofire


class ImpulseCommentHandler: APIHandler{
    
    @Published var impulseCommentDataResponse: ImpulseCommentModel?
    @Published var isLoading = false
            
//    http://wiesoftware.com/spine/apisecure/impluse/impluseComments/your_page_id/your_per_page_no/your_spine_id

        
func getImpulseCommentData() {
    isLoading = true
    
    let user = "devpankaj"
    let password = "devpankaj"
    let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
    let base64Credentials = credentialData.base64EncodedString(options: [])
    let headers: HTTPHeaders = ["Authorization": "Basic \(base64Credentials)", "X-API-KEY": "123run", "Content-Type": "application/x-www-form-urlencoded"]
    print(headers)
        let userId = UserDefaults.standard.string(forKey: "user_id")!
    let url = appConstants.kBASE_URL + "/impluse/impluseComments/1/10/41"

//    let params:[String:Any] = ["userId": userId, "spine_post_id": "20", "comment_id" : "0", "comment" : "abcd"]
    
    AF.request(url, method: .get, parameters: nil , encoding: URLEncoding.default, headers: headers).responseDecodable { [weak self] (response: DataResponse<ImpulseCommentModel, AFError>) in
        guard let weakSelf = self else { return }
        
        guard let response = weakSelf.handleResponse(response) as? ImpulseCommentModel else {
            weakSelf.isLoading = false
            return
        }
                        
        weakSelf.isLoading = false
        weakSelf.impulseCommentDataResponse = response
        }
    }
}

