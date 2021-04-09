//
//  EventGetCommentHandler.swift
//  Spine
//
//  Created by Aashita Tyagi on 08/04/21.
//

import Foundation
import Combine
import Alamofire


class EventGetCommentHandler: APIHandler{
    
    @Published var eventGetCommentResponse: EventGetCommentModel?
    @Published var isLoading = false
            

    func getEventCommentData() {
    isLoading = true
    
    let user = "devpankaj"
    let password = "devpankaj"
    let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
    let base64Credentials = credentialData.base64EncodedString(options: [])
    let headers: HTTPHeaders = ["Authorization": "Basic \(base64Credentials)", "X-API-KEY": "123run", "Content-Type": "application/x-www-form-urlencoded"]
    print(headers)
        
        let eventId = UserDefaults.standard.string(forKey: "eventId") ?? ""
    let url = appConstants.kBASE_URL + "events/getSpineEventsComment/" + eventId

//    let params:[String:Any] = ["userId": userId]
        print(url)
    
    AF.request(url, method: .get, parameters: nil , encoding: URLEncoding.default, headers: headers).responseDecodable { [weak self] (response: DataResponse<EventGetCommentModel, AFError>) in
        guard let weakSelf = self else { return }
        
        guard let response = weakSelf.handleResponse(response) as? EventGetCommentModel else {
            weakSelf.isLoading = false
            return
        }
                        
        weakSelf.isLoading = false
        weakSelf.eventGetCommentResponse = response
        print(response)
        }
    }
}

