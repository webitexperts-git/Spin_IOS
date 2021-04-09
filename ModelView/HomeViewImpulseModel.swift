//
//  HomeViewImpulseModel.swift
//  Spine
//
//  Created by apple on 15/01/21.
//


import Foundation
import SwiftUI
import Combine
import Alamofire

public class HomeViewImpulseModel: ObservableObject, Identifiable {
    

    @Published var isLoggedIn = false
    @Published var isLoading = false
    
    @Published var shouldNavigate = false
    
    private var disposables: Set<AnyCancellable> = []
    
    var homeImpulseHandler = HomeImpulseHandler()
    
    @Published var woofUrl = false
    @Published var data = [HomeImpulseModel.Data]()
    @Published var imageUrl = ""
    

    private var isLoadingPublisher: AnyPublisher<Bool, Never> {
        homeImpulseHandler.$isLoading
            .receive(on: RunLoop.main)
            .map { $0 }
            .eraseToAnyPublisher()
    }
    
    private var isAuthenticatedPublisher: AnyPublisher<Bool, Never> {
        homeImpulseHandler.$homeImpulseDataResponse
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
        homeImpulseHandler.$homeImpulseDataResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {
                return ""
                }
            return response.image ?? ""
        }
        .eraseToAnyPublisher()
    }
    
    
    
    private var isDataPublisher: AnyPublisher<[HomeImpulseModel.Data], Never> {
        homeImpulseHandler.$homeImpulseDataResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {
            return []
            }

                return (response.data ?? []) as [HomeImpulseModel.Data]
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
        
        
        isImageUrl
            .receive(on: RunLoop.main)
            .assign(to: \.imageUrl, on: self)
            .store(in: &disposables)
            print("HomeViewImpulseModelData",imageUrl)
        
//        UINavigationBar.appearance().barTintColor = .clear
//        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
//        UINavigationBar.appearance().shadowImage = UIImage()
        
    }
    
  

    
    
    
    func getHomeImpulseData() {
        homeImpulseHandler.getHomeImpulseData()
    }
    
}

