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


public class TrendingCatViewModel: ObservableObject, Identifiable {
    

    @Published var isLoggedIn = false
    @Published var isLoading = false
    
    @Published var shouldNavigate = false
    
    private var disposables: Set<AnyCancellable> = []
    
    var trendingHandler = TrendingCatHandler()
    
    @Published var woofUrl = false
    @Published var data = [TrendingCatModel.Data]()
    

    private var isLoadingPublisher: AnyPublisher<Bool, Never> {
        trendingHandler.$isLoading
            .receive(on: RunLoop.main)
            .map { $0 }
            .eraseToAnyPublisher()
    }
    
    private var isAuthenticatedPublisher: AnyPublisher<Bool, Never> {
        trendingHandler.$trendingDataResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {
                return false
                }
            return response.status ?? false
        }
        .eraseToAnyPublisher()
    }
    
    
    private var isDataPublisher: AnyPublisher<[TrendingCatModel.Data], Never> {
        trendingHandler.$trendingDataResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {

                    return []
                }
              
                return (response.data ?? []) as [TrendingCatModel.Data]
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
    
    func getTrendingData() {
        trendingHandler.getTrendingData()
    }
    
}


