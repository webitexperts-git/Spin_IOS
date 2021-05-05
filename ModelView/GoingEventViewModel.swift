//
//  GoingEventViewModel.swift
//  Spine
//
//  Created by Aashita Tyagi on 06/04/21.
//

import Foundation
import SwiftUI
import Combine


public class GoingEventViewModel: ObservableObject, Identifiable {
    
    @Published var string = ""
    @Published var isLoading = false
    
    @Published var shouldNavigate = false
    
    private var disposables: Set<AnyCancellable> = []
    
    var goingEventHandler = GoingEventHandler()
   
    @Published var woofUrl = false
    @Published var data:[GoingEventModel.Data] = []
    
    
    private var isLoadingPublisher: AnyPublisher<Bool, Never> {
        goingEventHandler.$isLoading
            .receive(on: RunLoop.main)
            .map { $0 }
            .eraseToAnyPublisher()
    }
    
    private var isAuthenticatedPublisher: AnyPublisher<Bool, Never> {
        goingEventHandler.$goingEventDataResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {
                return false
                }
            return response.status ?? false
        }
        .eraseToAnyPublisher()
    }
    
    
    private var isDataPublisher: AnyPublisher<[GoingEventModel.Data], Never> {
        goingEventHandler.$goingEventDataResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {

                    return []
                }
               
                return (response.data ?? []) as [GoingEventModel.Data]
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
    
    func getGoingEventData() {
        goingEventHandler.getGoingEventData()
    }
    
}

