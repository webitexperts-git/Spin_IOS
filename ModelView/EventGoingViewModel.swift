//
//  EventGoingViewModel.swift
//  Spine
//
//  Created by Aashita Tyagi on 07/04/21.
//

import Foundation
import SwiftUI
import Combine
import Alamofire


public class EventGoingViewModel: ObservableObject, Identifiable {
    
   
    @Published var isLoading = false
    
    @Published var shouldNavigate = false
    
    private var disposables: Set<AnyCancellable> = []
    
    var eventGoingHandler = EventGoingHandler()
    
    @Published var woofUrl = false
    @Published var data:EventGoingModel.Data?
    
    

    private var isLoadingPublisher: AnyPublisher<Bool, Never> {
        eventGoingHandler.$isLoading
            .receive(on: RunLoop.main)
            .map { $0 }
            .eraseToAnyPublisher()
    }
    
    private var isAuthenticatedPublisher: AnyPublisher<Bool, Never> {
        eventGoingHandler.$eventGoingResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {
                return false
                }
            return response.status ?? false
        }
        .eraseToAnyPublisher()
    }
    
    
    private var isDataPublisher: AnyPublisher<EventGoingModel.Data?, Never> {
        eventGoingHandler.$eventGoingResponse
            .receive(on: RunLoop.main)
            .map { response in
                let response = response
               
                return (response?.data) as EventGoingModel.Data?
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
        
        isDataPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.data, on: self)
            .store(in: &disposables)
        print("FollowersDetail",data)
    }
    
    func getEventGoingData() {
        eventGoingHandler.getEventGoingData()
    }
    
}




