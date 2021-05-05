//
//  EventCategoryViewModel.swift
//  Spine
//
//  Created by Aashita Tyagi on 13/04/21.
//

import Foundation
import SwiftUI
import Combine
import Alamofire


public class EventCategoryViewModel: ObservableObject, Identifiable {
    
   
    @Published var isLoading = false
    
    @Published var shouldNavigate = false
    
    private var disposables: Set<AnyCancellable> = []
    
    var eventCategoryHandler = EventCategoryHandler()
    
    @Published var woofUrl = false
    @Published var data:[EventCategoryModel.Data] = []
    
    

    private var isLoadingPublisher: AnyPublisher<Bool, Never> {
        eventCategoryHandler.$isLoading
            .receive(on: RunLoop.main)
            .map { $0 }
            .eraseToAnyPublisher()
    }
    
    private var isAuthenticatedPublisher: AnyPublisher<Bool, Never> {
        eventCategoryHandler.$eventCategoryResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {
                return false
                }
            return response.status ?? false
        }
        .eraseToAnyPublisher()
    }
    
    private var isEventCategoryPublisher: AnyPublisher<[EventCategoryModel.Data], Never> {
        eventCategoryHandler.$eventCategoryResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {
                return []
                }
                return response.data ?? [] as! [EventCategoryModel.Data]
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
        
        isEventCategoryPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.data, on: self)
            .store(in: &disposables)
//                print(woofUrl)
        
    }
    
    func getEventCategoryData() {
        eventCategoryHandler.getEventCategoryData()
    }
    
}




