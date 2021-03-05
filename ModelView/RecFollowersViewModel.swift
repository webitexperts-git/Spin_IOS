//
//  RecFollowersViewModel.swift
//  Spine
//
//  Created by Aashita Tyagi on 19/02/21.
//

import Foundation
import SwiftUI
import Combine
import Alamofire


public class RecFollowersViewModel: ObservableObject, Identifiable {
    
   
    @Published var isLoggedIn = false
    @Published var isLoading = false
    
    @Published var shouldNavigate = false
    
    private var disposables: Set<AnyCancellable> = []
    
    var recFollowersHandler = RecFollowersHandler()
    
    @Published var woofUrl = false
    @Published var data:[RecFollowersModel.Data] = []
   
    

    private var isLoadingPublisher: AnyPublisher<Bool, Never> {
        recFollowersHandler.$isLoading
            .receive(on: RunLoop.main)
            .map { $0 }
            .eraseToAnyPublisher()
    }
    
    private var isAuthenticatedPublisher: AnyPublisher<Bool, Never> {
        recFollowersHandler.$recFollowersDataResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {
                return false
                }
            return response.status ?? false
        }
        .eraseToAnyPublisher()
    }
    
    
    private var isDataPublisher: AnyPublisher<[RecFollowersModel.Data], Never> {
        recFollowersHandler.$recFollowersDataResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {

                    return []
                }
               
                return (response.data ?? []) as [RecFollowersModel.Data]
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
            print("RecFollowersViewModel",data)
    }
    
    func getRecFollowerstData() {
        recFollowersHandler.getRecFollowersData()
    }
    
}
