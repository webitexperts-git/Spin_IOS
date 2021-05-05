//
//  EventDetailHandler.swift
//  Spine
//
//  Created by Aashita Tyagi on 06/04/21.
//

import Foundation
import Combine
import Alamofire


class EventDetailHandler: APIHandler{
    
    @Published var eventDetailResponse: EventDetailModel?
    @Published var isLoading = false
            

    func getEventDetailData() {
    isLoading = true
    
    let user = "devpankaj"
    let password = "devpankaj"
    let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
    let base64Credentials = credentialData.base64EncodedString(options: [])
    let headers: HTTPHeaders = ["Authorization": "Basic \(base64Credentials)", "X-API-KEY": "123run", "Content-Type": "application/x-www-form-urlencoded"]
    print(headers)
        
//       https://seobywebitindia.com/dev/spine/apisecure/impluse/impluseLike/59/41
    
    let userId = UserDefaults.standard.string(forKey: "user_id") ?? ""
        let eventId = UserDefaults.standard.string(forKey: "eventId") ?? ""
        print("eventId123", eventId)
    let url = appConstants.kBASE_URL + "events/getEventsDetail/" + eventId + "/" + userId

//    let params:[String:Any] = ["userId": userId]
        print("newUrl",url)
    
    AF.request(url, method: .get, parameters: nil , encoding: URLEncoding.default, headers: headers).responseDecodable { [weak self] (response: DataResponse<EventDetailModel, AFError>) in
        guard let weakSelf = self else { return }
        
        guard let response = weakSelf.handleResponse(response) as? EventDetailModel else {
            weakSelf.isLoading = false
            return 
        }
                        
        weakSelf.isLoading = false
        weakSelf.eventDetailResponse = response
        print(response)
        }
    }
}

