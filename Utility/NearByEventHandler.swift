//
//  NearByEventHandler.swift
//  Spine
//
//  Created by Aashita Tyagi on 15/03/21.
//
import Foundation
import Combine
import Alamofire


class NearByEventHandler: APIHandler{
    
    @Published var nearByDataResponse: NearByEventModel?
    @Published var isLoading = false
    @Published var tap = false
    @Published var tap1 = false
    
//    http://wiesoftware.com/spine/apisecure/post/addUserPost


    func getNearByEventData() {
        isLoading = true
        
        let user = "devpankaj"
        let password = "devpankaj"
        let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers: HTTPHeaders = ["Authorization": "Basic \(base64Credentials)", "X-API-KEY": "123run", "Content-Type": "application/x-www-form-urlencoded"]
        print(headers)
            let userId = UserDefaults.standard.string(forKey: "user_id")!
           
    //   http://wiesoftware.com/spine/apisecure/events/getDistanceUsersEventsList/1/100/121/27.45/77.567/1000
        
        let url = appConstants.kBASE_URL + "events/getDistanceUsersEventsList/1/100/" + userId + "/28.6305/77.4149/100/"
        
        
        AF.request(url, method: .get, parameters: nil , encoding: URLEncoding.default, headers: headers).responseDecodable { [weak self] (response: DataResponse<NearByEventModel, AFError>) in
            guard let weakSelf = self else { return }
            
            guard let response = weakSelf.handleResponse(response) as? NearByEventModel else {
                weakSelf.isLoading = false
                return
            }
                            
            weakSelf.isLoading = false
            weakSelf.nearByDataResponse = response
            self?.tap = false
            self?.tap1 = true
            }
        }

}


