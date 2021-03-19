//
//  AllEventViewModel.swift
//  Spine
//
//  Created by Aashita Tyagi on 01/03/21.
//

import SwiftUI
import Combine
import Alamofire


public class AllEventViewModel: ObservableObject, Identifiable {
    
    
    @Published var email = ""
    @Published var data:[AllEventModel.Data] = []
    
    @Published var isLoggedIn = false
    @Published var isLoading = false
    
    @Published var shouldNavigate = false
    
//    @Published var eventStatus = ""
    
//    @Published var tap = true
//    @Published var tap1 = false
    
    private var disposables: Set<AnyCancellable> = []
    
    var allEventHandler = AllEventHandler()
    
    @Published var woofUrl = false
    @Published var event = ""
//    @Published var data:[RecFollowersModel.Data] = []
   
    private var isTapPublisher: AnyPublisher<String, Never> {
        allEventHandler.$eventStatus
            .receive(on: RunLoop.main)
//            .map { $0 }
            .eraseToAnyPublisher()
    }
//
//    private var isTap1Publisher: AnyPublisher<Bool, Never> {
//        allEventHandler.$tap1
//            .receive(on: RunLoop.main)
//            .map { $0 }
//            .eraseToAnyPublisher()
//    }

    private var isLoadingPublisher: AnyPublisher<Bool, Never> {
        allEventHandler.$isLoading
            .receive(on: RunLoop.main)
            .map { $0 }
            .eraseToAnyPublisher()
    }
    
    private var isAuthenticatedPublisher: AnyPublisher<Bool, Never> {
        allEventHandler.$allEventDataResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {
                return false
                }
            return response.status ?? false
        }
        .eraseToAnyPublisher()
    }
    
    
    private var isDataPublisher: AnyPublisher<[AllEventModel.Data], Never> {
        allEventHandler.$allEventDataResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {

                    return []
                }
               
                return (response.data ?? []) as [AllEventModel.Data]
        }
        .eraseToAnyPublisher()
    }
    
    
//    private var isEventPublisher: AnyPublisher<String, Never> {
//        allEventHandler.$allEventDataResponse
//            .receive(on: RunLoop.main)
//            .map { [self] response in
//                guard let response = response else {
//
//                    return ""
//                }
//
//                return (string )
//        }
//        .eraseToAnyPublisher()
//    }
    
    
       
  
    
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
        
        
        isDataPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.data, on: self)
            .store(in: &disposables)
            print("AllEventsData",data)
        
        
//        isTapPublisher
//            .receive(on: RunLoop.main)
//            .assign(to: \.eventStatus, on: self)
//            .store(in: &disposables)
//            print("eventStatus",eventStatus)
//
        isTapPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.event, on: self)
            .store(in: &disposables)

//            eventStatus = "nearby"
        
        
    }
    
    
    func getAllEventData(event:String) {
        let event = event
        allEventHandler.getAllEventData(event: event)
    }
    
}

