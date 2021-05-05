//
//  FollowingEventViewModel.swift
//  Spine
//
//  Created by Aashita Tyagi on 06/04/21.
//

import Foundation
import SwiftUI
import Combine


public class FollowingEventViewModel: ObservableObject, Identifiable {
    
    @Published var string = ""
    @Published var isLoading = false
    
    @Published var shouldNavigate = false
    
    private var disposables: Set<AnyCancellable> = []
    
    var followingEventHandler = FollowingEventHandler()
   
    @Published var woofUrl = false
    @Published var data:[FollowingEventModel.Data] = []
    
    
    private var isLoadingPublisher: AnyPublisher<Bool, Never> {
        followingEventHandler.$isLoading
            .receive(on: RunLoop.main)
            .map { $0 }
            .eraseToAnyPublisher()
    }
    
    private var isAuthenticatedPublisher: AnyPublisher<Bool, Never> {
        followingEventHandler.$followingEventDataResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {
                return false
                }
            return response.status ?? false
        }
        .eraseToAnyPublisher()
    }
    
    
    private var isDataPublisher: AnyPublisher<[FollowingEventModel.Data], Never> {
        followingEventHandler.$followingEventDataResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {

                    return []
                }
               
                return (response.data ?? []) as [FollowingEventModel.Data]
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
    
    func getFollowingEventData() {
        followingEventHandler.getFollowingEventData()
    }
    
}

