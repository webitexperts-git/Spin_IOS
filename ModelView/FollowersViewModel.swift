//
//  TrendingCatViewModel.swift
//  Spine
//
//  Created by apple on 18/01/21.
//

import Foundation
import SwiftUI
import Combine
import Alamofire


public class FollowersViewModel: ObservableObject, Identifiable {
    

    @Published var isLoggedIn = false
    @Published var isLoading = false
    
    @Published var shouldNavigate = false
    
    private var disposables: Set<AnyCancellable> = []
    
    var followersHandler = FollowersHandler()
    
    @Published var woofUrl = false
    @Published var data:[FollowersModel.Data] = []
   
    

    private var isLoadingPublisher: AnyPublisher<Bool, Never> {
        followersHandler.$isLoading
            .receive(on: RunLoop.main)
            .map { $0 }
            .eraseToAnyPublisher()
    }
    
    private var isAuthenticatedPublisher: AnyPublisher<Bool, Never> {
        followersHandler.$followersDataResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {
                return false
                }
            return response.status ?? false
        }
        .eraseToAnyPublisher()
    }
    
    
    private var isDataPublisher: AnyPublisher<[FollowersModel.Data], Never> {
        followersHandler.$followersDataResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {

                    return []
                }
                return response.data ?? []

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
            print("HomeViewImpulseModelData",data)
    }
    
    func getFollowersData() {
        followersHandler.getFollowersData()
    }
    
}



