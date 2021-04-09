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


public class EventGetCommentViewModel: ObservableObject, Identifiable {
    
   
    @Published var isLoading = false
    
    @Published var shouldNavigate = false
    
    private var disposables: Set<AnyCancellable> = []
    
    var eventGetCommentHandler = EventGetCommentHandler()
    
    @Published var woofUrl = false
    @Published var data:[EventGetCommentModel.Data] = []
    
    

    private var isLoadingPublisher: AnyPublisher<Bool, Never> {
        eventGetCommentHandler.$isLoading
            .receive(on: RunLoop.main)
            .map { $0 }
            .eraseToAnyPublisher()
    }
    
    private var isAuthenticatedPublisher: AnyPublisher<Bool, Never> {
        eventGetCommentHandler.$eventGetCommentResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {
                return false
                }
            return response.status ?? false
        }
        .eraseToAnyPublisher()
    }
    
    
    private var isDataPublisher: AnyPublisher<[EventGetCommentModel.Data], Never> {
        eventGetCommentHandler.$eventGetCommentResponse
            .receive(on: RunLoop.main)
            .map { response in
                let response = response
               
                return (response?.data ?? []) as [EventGetCommentModel.Data]
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
    
    func getEventCommentData() {
        eventGetCommentHandler.getEventCommentData()
    }
    
}




