//
//  StoriesViewModel.swift
//  Spine
//
//  Created by apple on 18/01/21.
//

import Foundation
import SwiftUI
import Combine
import Alamofire


public class StoriesViewModel: ObservableObject, Identifiable {
    

    @Published var isLoggedIn = false
    @Published var isLoading = false
    
    @Published var shouldNavigate = false
    
    private var disposables: Set<AnyCancellable> = []
    
    var storiesHandler = StoriesHandler()
    
    @Published var woofUrl = false
    @Published var data = [StoriesModel.Data]()
//    @Published var stories_data = [StoriesModel.Data.Stories_data]()
   
    

    private var isLoadingPublisher: AnyPublisher<Bool, Never> {
        storiesHandler.$isLoading
            .receive(on: RunLoop.main)
            .map { $0 }
            .eraseToAnyPublisher()
    }
    
    private var isAuthenticatedPublisher: AnyPublisher<Bool, Never> {
        storiesHandler.$storiesDataResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {
                return false
                }
            return response.status ?? false
        }
        .eraseToAnyPublisher()
    }
    
    
    private var isDataPublisher: AnyPublisher<[StoriesModel.Data], Never> {
        storiesHandler.$storiesDataResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {

                    return []
                }
                return (response.data ?? []) as [StoriesModel.Data] 

        }
        .eraseToAnyPublisher()
    }
    
//    private var isDataStoriesPublisher: AnyPublisher<[StoriesModel.Data.Stories_data], Never> {
//        storiesHandler.$storiesDataResponse
//            .receive(on: RunLoop.main)
//            .map { response in
//                guard let response = response else {
//
//                    return []
//                }
//                print(response.data?[0].stories_data ?? [])
//                return (response.data?[0].stories_data ?? []) as [StoriesModel.Data.Stories_data]
//
//
//        }
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
        
        
//        isDataStoriesPublisher
//            .receive(on: RunLoop.main)
//            .assign(to: \.stories_data, on: self)
//            .store(in: &disposables)
//        print("HomeViewImpulseModelData",stories_data)
    }
    
  

    
    func getStoriesData() {
        storiesHandler.getStoriesData()
    }
    
}

