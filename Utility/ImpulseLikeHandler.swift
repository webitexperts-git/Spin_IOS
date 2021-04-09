//
//  ImpulseLikeHandler.swift
//  Spine
//
//  Created by Aashita Tyagi on 31/03/21.
//

import Foundation
import Combine
import Alamofire


class ImpulseLikeHandler: APIHandler{
    
    @Published var impulseLikeResponse: ImpulseLikeModel?
    @Published var isLoading = false
            
   
        
    func getImpulseLikeData() {
    isLoading = true
    
    let user = "devpankaj"
    let password = "devpankaj"
    let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
    let base64Credentials = credentialData.base64EncodedString(options: [])
    let headers: HTTPHeaders = ["Authorization": "Basic \(base64Credentials)", "X-API-KEY": "123run", "Content-Type": "application/x-www-form-urlencoded"]
    print(headers)
        
//       https://seobywebitindia.com/dev/spine/apisecure/impluse/impluseLike/59/41
    
    let userId = UserDefaults.standard.string(forKey: "user_id") ?? ""
    
    let url = appConstants.kBASE_URL + appConstants.kimpluseLike + userId + "41"

//    let params:[String:Any] = ["userId": userId]
    
    AF.request(url, method: .get, parameters: nil , encoding: URLEncoding.default, headers: headers).responseDecodable { [weak self] (response: DataResponse<ImpulseLikeModel, AFError>) in
        guard let weakSelf = self else { return }
        
        guard let response = weakSelf.handleResponse(response) as? ImpulseLikeModel else {
            weakSelf.isLoading = false
            return
        }
                        
        weakSelf.isLoading = false
        weakSelf.impulseLikeResponse = response
        }
    }
}

