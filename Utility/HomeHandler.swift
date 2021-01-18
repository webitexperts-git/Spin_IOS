//
//  HomeHandler.swift
//  Spine
//
//  Created by apple on 06/01/21.
//

import Foundation
import Combine
import Alamofire

class HomeHandler: APIHandler{
    @Published var homeWelcomeDataResponse: HomeModel?
    @Published var homeImpulseDataResponse: HomeModel?
    @Published var isLoading = false
//    @Published var data : [HomeModel.Data]?
    @Published var data : [HomeModel.Data]?
    func getHomeWelcomeData() {
        isLoading = true
        
        
//        let url = appConstants.kBASE_URL + appConstants.kregisterUsers
        let user = "devpankaj"
        let password = "devpankaj"
        let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers: HTTPHeaders = ["Authorization": "Basic \(base64Credentials)", "X-API-KEY": "123run", "Content-Type": "application/x-www-form-urlencoded"]
        print(headers)
        
        let url = "http://wiesoftware.com/spine/apisecure/other/getWelcomeData"
        
        AF.request(url, method: .get, parameters: nil , encoding: URLEncoding.default, headers: headers).responseDecodable { [weak self] (response: DataResponse<HomeModel, AFError>) in
            guard let weakSelf = self else { return }
            
            guard let response = weakSelf.handleResponse(response) as? HomeModel else {
                weakSelf.isLoading = false
                return
            }
                            
            weakSelf.isLoading = false
            weakSelf.homeWelcomeDataResponse = response
            weakSelf.data = response.data
            print("HandlerData", weakSelf.data as Any)

        }
    }
    
  
}
