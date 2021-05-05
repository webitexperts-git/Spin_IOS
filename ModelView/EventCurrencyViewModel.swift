//
//  EventCurrencyViewModel.swift
//  Spine
//
//  Created by Aashita Tyagi on 19/04/21.
//

import Foundation
import SwiftUI
import Combine
import Alamofire


public class EventCurrencyViewModel: ObservableObject, Identifiable {
    
   
    @Published var isLoading = false
    
    @Published var shouldNavigate = false
    
    private var disposables: Set<AnyCancellable> = []
    
    var eventCurrencyHandler = EventCurrencyHandler()
    
    @Published var woofUrl = false
    @Published var data:[EventCurrencyModel.Data] = []
    
    

    private var isLoadingPublisher: AnyPublisher<Bool, Never> {
        eventCurrencyHandler.$isLoading
            .receive(on: RunLoop.main)
            .map { $0 }
            .eraseToAnyPublisher()
    }
    
    private var isAuthenticatedPublisher: AnyPublisher<Bool, Never> {
        eventCurrencyHandler.$eventCurrencyResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {
                return false
                }
            return response.status ?? false
        }
        .eraseToAnyPublisher()
    }
    
    private var isEventCurrencyPublisher: AnyPublisher<[EventCurrencyModel.Data], Never> {
        eventCurrencyHandler.$eventCurrencyResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {
                return []
                }
                return response.data ?? [] as! [EventCurrencyModel.Data]
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
        
        isEventCurrencyPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.data, on: self)
            .store(in: &disposables)
//                print(woofUrl)
        
    }
    
    func getEventCurrencyData() {
        eventCurrencyHandler.getEventCurrencyData()
    }
    
}




