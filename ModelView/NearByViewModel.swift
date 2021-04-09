//
//  NearByViewModel.swift
//  Spine
//
//  Created by Aashita Tyagi on 10/03/21.
//

import Foundation
import SwiftUI
import Combine
import Alamofire


public class NearByViewModel: ObservableObject, Identifiable {
    
    @Published var string = ""
    @Published var isLoading = false
    
    @Published var shouldNavigate = false
    @Published var event = ""
    private var disposables: Set<AnyCancellable> = []
    
    var nearByEventHandler = NearByEventHandler()
    @Published var tap1 = false
    @Published var tap = false
    @Published var woofUrl = false
    @Published var data:[NearByEventModel.Data] = []
    
    

    private var isLoadingPublisher: AnyPublisher<Bool, Never> {
        nearByEventHandler.$isLoading
            .receive(on: RunLoop.main)
            .map { $0 }
            .eraseToAnyPublisher()
    }
    
    private var isAuthenticatedPublisher: AnyPublisher<Bool, Never> {
        nearByEventHandler.$nearByDataResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {
                return false
                }
            return response.status ?? false
        }
        .eraseToAnyPublisher()
    }
    
    
    private var isDataPublisher: AnyPublisher<[NearByEventModel.Data], Never> {
        nearByEventHandler.$nearByDataResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {

                    return []
                }
               
                return (response.data ?? []) as [NearByEventModel.Data]
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
    
    func getNearByEventData() {
        nearByEventHandler.getNearByEventData()
    }
    
}

