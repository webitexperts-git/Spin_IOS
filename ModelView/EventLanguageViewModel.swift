//
//  EventLanguageViewModel.swift
//  Spine
//
//  Created by Aashita Tyagi on 15/04/21.
//

import Foundation
import SwiftUI
import Combine
import Alamofire


public class EventLanguageViewModel: ObservableObject, Identifiable {
    
   
    @Published var isLoading = false
    
    @Published var shouldNavigate = false
    
    private var disposables: Set<AnyCancellable> = []
    
    var eventLanguageHandler = EventLanguageHandler()
    
    @Published var woofUrl = false
    @Published var data:[EventLanguageModel.Data] = []
    
    

    private var isLoadingPublisher: AnyPublisher<Bool, Never> {
        eventLanguageHandler.$isLoading
            .receive(on: RunLoop.main)
            .map { $0 }
            .eraseToAnyPublisher()
    }
    
    private var isAuthenticatedPublisher: AnyPublisher<Bool, Never> {
        eventLanguageHandler.$eventLanguageResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {
                return false
                }
            return response.status ?? false
        }
        .eraseToAnyPublisher()
    }
    
    private var isEventCategoryPublisher: AnyPublisher<[EventLanguageModel.Data], Never> {
        eventLanguageHandler.$eventLanguageResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {
                return []
                }
                return response.data ?? [] as! [EventLanguageModel.Data]
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
    
    func getEventLanguageData() {
        eventLanguageHandler.getEventLanguageData()
    }
    
}




