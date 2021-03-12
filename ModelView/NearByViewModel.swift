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
    
    private var disposables: Set<AnyCancellable> = []
    
    var allEventHandler = AllEventHandler()
    
    @Published var woofUrl = false
    @Published var data:[NearByModel.Data] = []
    
    

    private var isLoadingPublisher: AnyPublisher<Bool, Never> {
        allEventHandler.$isLoading
            .receive(on: RunLoop.main)
            .map { $0 }
            .eraseToAnyPublisher()
    }
    
    private var isAuthenticatedPublisher: AnyPublisher<Bool, Never> {
        allEventHandler.$nearByEventDataResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {
                return false
                }
            return response.status ?? false
        }
        .eraseToAnyPublisher()
    }
    
    
    private var isDataPublisher: AnyPublisher<[NearByModel.Data], Never> {
        allEventHandler.$nearByEventDataResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {

                    return []
                }
               
                return (response.data ?? []) as [NearByModel.Data]
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
        allEventHandler.getNearByEventData()
    }
    
}

