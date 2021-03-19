//
//  AllEventHandler.swift
//  Spine
//
//  Created by Aashita Tyagi on 01/03/21.
//

import Foundation
import Combine
import Alamofire


class AllEventHandler: APIHandler{
    
    @Published var allEventDataResponse: AllEventModel?
    @Published var isLoading = false
    @Published var eventStatus = "all"
    @Published var nearByEventDataResponse: NearByEventModel?
//    http://wiesoftware.com/spine/apisecure/post/addUserPost
        var url = ""
    func getAllEventData(event: String) {
    isLoading = true
    print("event", event)
        let userId = UserDefaults.standard.string(forKey: "user_id")!
        if event == "all"{
            eventStatus = "all"
//            print(eventStatus)
            url = appConstants.kBASE_URL + "events/getUsersEventsList/1/100/" + userId
        }else{
//            eventStatus = "getDistanceUsersEventsList/1/100/" + userId + "/27.45/77.567/100"
                eventStatus = "nearby"
            url = appConstants.kBASE_URL + "events/getDistanceUsersEventsList/1/100/" + userId + "/27.45/77.56/500"
          
//            print(eventStatus)
        }
    let user = "devpankaj"
    let password = "devpankaj"
    let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
    let base64Credentials = credentialData.base64EncodedString(options: [])
    let headers: HTTPHeaders = ["Authorization": "Basic \(base64Credentials)", "X-API-KEY": "123run", "Content-Type": "application/x-www-form-urlencoded"]
    print(headers)
       
       
//    http://wiesoftware.com/spine/apisecure/events/getUsersEventsList/1/10/212
    
    
    
    
//            let url = appConstants.kBASE_URL + "events/" + eventStatus + "/1/100/" + userId
        print(url)
    
    AF.request(url, method: .get, parameters: nil , encoding: URLEncoding.default, headers: headers).responseDecodable { [weak self] (response: DataResponse<AllEventModel, AFError>) in
        guard let weakSelf = self else { return }
        
        guard let response = weakSelf.handleResponse(response) as? AllEventModel else {
            weakSelf.isLoading = false
            return
        }
                        
        weakSelf.isLoading = false
        weakSelf.allEventDataResponse = response
        weakSelf.eventStatus = event
        }
    }
    
    
    func getNearByEventData(event:String) {
        isLoading = true
        
        let user = "devpankaj"
        let password = "devpankaj"
        let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers: HTTPHeaders = ["Authorization": "Basic \(base64Credentials)", "X-API-KEY": "123run", "Content-Type": "application/x-www-form-urlencoded"]
        print(headers)
            let userId = UserDefaults.standard.string(forKey: "user_id")!
           
    //   http://wiesoftware.com/spine/apisecure/events/getDistanceUsersEventsList/1/100/121/27.45/77.567/1000
        
        let url = appConstants.kBASE_URL + "events/getDistanceUsersEventsList/1/100/" + userId + "/27.45/77.567/100/"

        
        AF.request(url, method: .get, parameters: nil , encoding: URLEncoding.default, headers: headers).responseDecodable { [weak self] (response: DataResponse<NearByEventModel, AFError>) in
            guard let weakSelf = self else { return }
            
            guard let response = weakSelf.handleResponse(response) as? NearByEventModel else {
                weakSelf.isLoading = false
                return
            }
                            
            weakSelf.isLoading = false
            weakSelf.nearByEventDataResponse = response
            }
        }

}


