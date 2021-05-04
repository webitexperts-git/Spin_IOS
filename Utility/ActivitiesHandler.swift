//
//  EventCurrencyHandler.swift
//  Spine
//
//  Created by Aashita Tyagi on 19/04/21.
//

import Foundation
import Combine
import Alamofire

class ActivitiesHandler: APIHandler{
    
@Published var activitiesResponse: ActivitiesModel?
@Published var isLoading = false
        

func getActivitiesData() {
isLoading = true

let user = "devpankaj"
let password = "devpankaj"
let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
let base64Credentials = credentialData.base64EncodedString(options: [])
let headers: HTTPHeaders = ["Authorization": "Basic \(base64Credentials)", "X-API-KEY": "123run", "Content-Type": "application/x-www-form-urlencoded"]
print(headers)
    
    let userId = UserDefaults.standard.string(forKey: "user_id") ?? ""
    let url = appConstants.kBASE_URL + "post/getSpineUserActivityList/1/100/" + userId +  "/0"

//    let params:[String:Any] = ["userId": userId, "type": "1", "spine_event_id": "91", ]
    print(url)

AF.request(url, method: .get, parameters: nil , encoding: URLEncoding.default, headers: headers).responseDecodable { [weak self] (response: DataResponse<ActivitiesModel, AFError>) in
    guard let weakSelf = self else { return }
    
    guard let response = weakSelf.handleResponse(response) as? ActivitiesModel else {
        weakSelf.isLoading = false
        return
    }
                    
    weakSelf.isLoading = false
    weakSelf.activitiesResponse = response
    print(response)
    }
}
    
    func getFollowingActivitiesData() {
    isLoading = true

    let user = "devpankaj"
    let password = "devpankaj"
    let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
    let base64Credentials = credentialData.base64EncodedString(options: [])
    let headers: HTTPHeaders = ["Authorization": "Basic \(base64Credentials)", "X-API-KEY": "123run", "Content-Type": "application/x-www-form-urlencoded"]
    print(headers)
        
        let userId = UserDefaults.standard.string(forKey: "user_id") ?? ""
        let url = appConstants.kBASE_URL + "post/getSpineUserActivityList/1/100/" + userId +  "/1"

    //    let params:[String:Any] = ["userId": userId, "type": "1", "spine_event_id": "91", ]
        print(url)

    AF.request(url, method: .get, parameters: nil , encoding: URLEncoding.default, headers: headers).responseDecodable { [weak self] (response: DataResponse<ActivitiesModel, AFError>) in
        guard let weakSelf = self else { return }
        
        guard let response = weakSelf.handleResponse(response) as? ActivitiesModel else {
            weakSelf.isLoading = false
            return
        }
                        
        weakSelf.isLoading = false
        weakSelf.activitiesResponse = response
        print(response)
        }
    }

}

