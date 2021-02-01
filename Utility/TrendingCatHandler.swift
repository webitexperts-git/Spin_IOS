//
//  TrendingCatHandler.swift
//  Spine
//
//  Created by apple on 18/01/21.
//

import Foundation
import Combine
import Alamofire


class TrendingCatHandler: APIHandler{
    
    @Published var trendingDataResponse: TrendingCatModel?
    @Published var isLoading = false
            
   
        
func getTrendingData() {
    isLoading = true
    
    let user = "devpankaj"
    let password = "devpankaj"
    let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
    let base64Credentials = credentialData.base64EncodedString(options: [])
    let headers: HTTPHeaders = ["Authorization": "Basic \(base64Credentials)", "X-API-KEY": "123run", "Content-Type": "application/x-www-form-urlencoded"]
    print(headers)
    
    let url = appConstants.kBASE_URL + ""
    let userId = UserDefaults.standard.string(forKey: "user_id")!
    let params:[String:Any] = ["userId": userId]
    
    AF.request(url, method: .get, parameters: params , encoding: URLEncoding.default, headers: headers).responseDecodable { [weak self] (response: DataResponse<TrendingCatModel, AFError>) in
        guard let weakSelf = self else { return }
        
        guard let response = weakSelf.handleResponse(response) as? TrendingCatModel else {
            weakSelf.isLoading = false
            return
        }
                        
        weakSelf.isLoading = false
        weakSelf.trendingDataResponse = response
        }
    }
}

