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
//    @Published var date = HomeImpulseModel.Data()
//    @Published var date = HomeImpulseModel.Data
    

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
    
    
//    private var isDatePublisher: AnyPublisher<HomeImpulseModel.Data, Never> {
//        homeImpulseHandler.$homeImpulseDataResponse
//            .receive(on: RunLoop.main)
//            .map { response in
//                guard let response = response else {
//            return ""
//            }
//                let date1 = Date()
//                let date2 = response.data.created_on!
//                print("date2", date2, date1)
//                let diffs = Calendar.current.dateComponents([.day], from: date1, to: date2)
//                print(diffs)
//
//
//                return (response.data.created_on ?? "") as String
//    }
//        .eraseToAnyPublisher()
//    }
    
        
  
    
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
        
        
//        isDatePublisher
//            .receive(on: RunLoop.main)
//            .assign(to: \.date, on: self)
//            .store(in: &disposables)
//            print("Date",date)
    }
    
  

    
    
    
    func getHomeImpulseData() {
        homeImpulseHandler.getHomeImpulseData()
    }
    
}

