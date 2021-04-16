//
//  EventBookHandler.swift
//  Spine
//
//  Created by Aashita Tyagi on 12/04/21.
//

import Foundation
import Combine
import Alamofire


class EventBookHandler: APIHandler{
    
    @Published var eventBookResponse: EventBookModel?
    @Published var isLoading = false
            

    func getEventBookData() {
    isLoading = true
    
    let user = "devpankaj"
    let password = "devpankaj"
    let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
    let base64Credentials = credentialData.base64EncodedString(options: [])
    let headers: HTTPHeaders = ["Authorization": "Basic \(base64Credentials)", "X-API-KEY": "123run", "Content-Type": "application/x-www-form-urlencoded"]
    print(headers)
        
        let userId = UserDefaults.standard.string(forKey: "user_id") ?? ""
    let eventId = UserDefaults.standard.string(forKey: "eventId") ?? ""
    let url = appConstants.kBASE_URL + "events/addEventBooking"

        let params:[String:Any] = ["userId": userId, "type": "1", "spine_event_id": "91", ]
        print(url)
    
    AF.request(url, method: .post, parameters: nil , encoding: URLEncoding.default, headers: headers).responseDecodable { [weak self] (response: DataResponse<EventBookModel, AFError>) in
        guard let weakSelf = self else { return }
        
        guard let response = weakSelf.handleResponse(response) as? EventBookModel else {
            weakSelf.isLoading = false
            return
        }
                        
        weakSelf.isLoading = false
        weakSelf.eventBookResponse = response
        print(response)
        }
    }
}

