//
//  EventPostHandler.swift
//  Spine
//
//  Created by Aashita Tyagi on 19/04/21.
//

import Foundation
import Combine
import Alamofire

class EventPostHandler: APIHandler{
    
@Published var eventPostResponse: EventPostModel?
@Published var isLoading = false
    
    
    func getEventPostData(eventTitle: String, eventType:String, startDate: String, startTime: String, endDate: String, endTime: String, timeZone: String, location: String, addLink: String, aboutEvent: String, eventCategory: String, fee: String, symbol: String, attendee: String, language: String, acceptParticipaient: String, allowComment: Bool, image: Data) {
        
        let url = appConstants.kBASE_URL + "/events/addUserEvents"
        
        let userId  = UserDefaults.standard.string(forKey: "user_id")

        let params:[String:Any] = ["userId": userId!, "type": eventType, "allow_comments": allowComment, "title": eventTitle, "description": aboutEvent, "start_time": startTime, "start_date": startDate, "end_time": endTime, "end_date": endDate, "timezone": timeZone, "location": location, "latitude": "27.567", "longitude": "27.567", "link_of_event": addLink, "event_categories": "art", "fee_currency": symbol, "max_attendees": attendee, "language": language, "accept_participants": acceptParticipaient, "multiple": "0", "files":image, "fee": fee]
    print(url)
        
        AF.upload(multipartFormData: { multiPart in
            for (key, value) in params {
                if let temp = value as? String {
                    multiPart.append(temp.data(using: .utf8)!, withName: key)
                }
                if let temp = value as? Int {
                    multiPart.append("\(temp)".data(using: .utf8)!, withName: key)
                }
                if let temp = value as? NSArray {
                    temp.forEach({ element in
                        let keyObj = key + "[]"
                        if let string = element as? String {
                            multiPart.append(string.data(using: .utf8)!, withName: keyObj)
                        } else
                            if let num = element as? Int {
                                let value = "\(num)"
                                multiPart.append(value.data(using: .utf8)!, withName: keyObj)
                        }
                    })
                }
            }
            multiPart.append(image, withName: "file", fileName: "file.png", mimeType: "image/png")
        }, with: url as! URLRequestConvertible)
            .uploadProgress(queue: .main, closure: { progress in
                //Current upload progress of file
                print("Upload Progress: \(progress.fractionCompleted)")
            })
            .responseJSON(completionHandler: { response in
                //Do what ever you want to do with response
                    if let error = response.error {
                        print(error)
                    }
                    guard let data = response.value else {
                        return
                    }
                    print(data)
            })
    }

  

        

    func getEventPostData1(eventTitle: String, eventType:String, startDate: String, startTime: String, endDate: String, endTime: String, timeZone: String, location: String, addLink: String, aboutEvent: String, eventCategory: String, fee: String, symbol: String, attendee: String, language: String, acceptParticipaient: String, allowComment: Bool, image: Data) {
    
isLoading = true

let user = "devpankaj"
let password = "devpankaj"
let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
let base64Credentials = credentialData.base64EncodedString(options: [])
let headers: HTTPHeaders = ["Authorization": "Basic \(base64Credentials)", "X-API-KEY": "123run", "Content-Type": "application/x-www-form-urlencoded"]
print(headers)
    
    print(eventTitle, eventType, startDate, startTime, endDate,endTime, timeZone, location, addLink, aboutEvent, eventCategory, fee, symbol, attendee, language, acceptParticipaient, allowComment)
    
   
        let url = appConstants.kBASE_URL + "/events/addUserEvents"

//    let params:[String:Any] = ["userId": userId, "type": "1", "spine_event_id": "91", ]
    print(url)

AF.request(url, method: .get, parameters: nil , encoding: URLEncoding.default, headers: headers).responseDecodable { [weak self] (response: DataResponse<EventPostModel, AFError>) in
    guard let weakSelf = self else { return }
    
    guard let response = weakSelf.handleResponse(response) as? EventPostModel else {
        weakSelf.isLoading = false
        return
    }
                    
    weakSelf.isLoading = false
    weakSelf.eventPostResponse = response
    print(response)
    }
}
}

