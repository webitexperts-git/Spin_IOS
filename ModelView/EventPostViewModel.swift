//
//  EventPostViewModel.swift
//  Spine
//
//  Created by Aashita Tyagi on 19/04/21.
//

import Foundation
import SwiftUI
import Combine
import Alamofire


public class EventPostViewModel: ObservableObject, Identifiable {
    
    var image: Image? = nil
    @Published var isLoading = false
    
    @Published var shouldNavigate = false
    
    private var disposables: Set<AnyCancellable> = []
    
    var eventPostHandler = EventPostHandler()
    
    @Published var woofUrl = false
//    @Published var data:[EventBookModel.Data] = []
    
    

    private var isLoadingPublisher: AnyPublisher<Bool, Never> {
        eventPostHandler.$isLoading
            .receive(on: RunLoop.main)
            .map { $0 }
            .eraseToAnyPublisher()
    }
    
    private var isAuthenticatedPublisher: AnyPublisher<Bool, Never> {
        eventPostHandler.$eventPostResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {
                return false
                }
            return response.status ?? false
        }
        .eraseToAnyPublisher()
    }
    



    init() {
        isLoadingPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.isLoading, on: self)
            .store(in: &disposables)
        
        isAuthenticatedPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.woofUrl, on: self)
            .store(in: &disposables)
//                print(woofUrl)
        
    }
    
    func getEventPostData(eventTitle: String, eventType:String, startDate: String, startTime: String, endDate: String, endTime: String, timeZone: String, location: String, addLink: String, aboutEvent: String, eventCategory: String, fee: String, symbol: String, attendee: String, language: String, acceptParticipaient: String, allowComment: Bool, image: Data) {
        
        let eventTitle = eventTitle
        let eventType = eventType
        let startDate = startDate
        let startTime = startTime
        let endDate = endDate
        let endTime = endTime
        let timeZone = timeZone
        let location = location
        let eventLink = addLink
        let aboutEvent = aboutEvent
        let eventCategory = eventCategory
        let eventFee = fee
        let currency = symbol
        let attendee = attendee
        let language = language
        let acceptParticipaient = acceptParticipaient
        let allowComment = allowComment
        let image = image
        
        let userId  = UserDefaults.standard.string(forKey: "user_id")
        
        eventPostHandler.upload(image: image, params:["user_id": userId!, "type": eventType, "allow_comments": 1, "title": eventTitle, "description": aboutEvent, "start_time": startTime, "start_date": startDate, "end_time": endTime, "end_date": endDate, "timezone": timeZone, "location": location, "latitude": "27.567", "longitude": "27.567", "link_of_event": addLink, "event_categories": "art", "fee_currency": symbol, "max_attendees": attendee, "language": language, "accept_participants": acceptParticipaient, "multiple": "0", "fee": fee])
        
    
    }
    
}




