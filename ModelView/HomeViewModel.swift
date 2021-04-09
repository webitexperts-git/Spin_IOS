//
//  HomeViewModel.swift
//  Spine
//
//  Created by apple on 06/01/21.
//

import Foundation
import SwiftUI
import Combine
import Alamofire

public class HomeViewModel: ObservableObject, Identifiable {
    

    @Published var isLoggedIn = false
    @Published var isLoading = false
    
    @Published var shouldNavigate = false
    
    private var disposables: Set<AnyCancellable> = []
    
    var homeHandler = HomeHandler()
    
    @Published var woofUrl = false
    @Published var newData = [HomeModel.Data]()
    @Published var imageUrl = ""
   
    private var isLoadingPublisher: AnyPublisher<Bool, Never> {
        homeHandler.$isLoading
            .receive(on: RunLoop.main)
            .map { $0 }
            .eraseToAnyPublisher()
    }
    
    private var isAuthenticatedPublisher: AnyPublisher<Bool, Never> {
        homeHandler.$homeWelcomeDataResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {
                return false
                }
            return response.status ?? false
        }
        .eraseToAnyPublisher()
    }
    
    private var isImageUrl: AnyPublisher<String, Never> {
        homeHandler.$homeWelcomeDataResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {
                return ""
                }
            return response.image ?? ""
        }
        .eraseToAnyPublisher()
    }
    
    
    private var isDataPublisher: AnyPublisher<[HomeModel.Data], Never> {
        homeHandler.$homeWelcomeDataResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {
            return []
            }

            return response.data! as [HomeModel.Data]
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
                print("HomeStatus",woofUrl)
        
        isDataPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.newData, on: self)
            .store(in: &disposables)
            print("HomeViewModelData",newData)
        
        
        isImageUrl
            .receive(on: RunLoop.main)
            .assign(to: \.imageUrl, on: self)
            .store(in: &disposables)
            print("HomeViewModelData",imageUrl)
        
    }
    
    func getHomeWelcomeData() {
        homeHandler.getHomeWelcomeData()
    }
    
}
