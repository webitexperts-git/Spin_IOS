
//
//  UserPostViewModel.swift
//  Spine
//
//  Created by Aashita Tyagi on 08/02/21.
//

import Foundation
import SwiftUI
import Combine
import Alamofire


public class ImpulseCommentViewModel: ObservableObject, Identifiable {
    
    @Published var email = ""
    @Published var isLoggedIn = false
    @Published var isLoading = false
    
    @Published var shouldNavigate = false
    
    private var disposables: Set<AnyCancellable> = []
    
    var impulseCommentHandler = ImpulseCommentHandler()
    
    @Published var woofUrl = false
    @Published var data:[ImpulseCommentModel.Data] = []
   
    

    private var isLoadingPublisher: AnyPublisher<Bool, Never> {
        impulseCommentHandler.$isLoading
            .receive(on: RunLoop.main)
            .map { $0 }
            .eraseToAnyPublisher()
    }
    
    private var isAuthenticatedPublisher: AnyPublisher<Bool, Never> {
        impulseCommentHandler.$impulseCommentDataResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {
                return false
                }
            return response.status ?? false
        }
        .eraseToAnyPublisher()
    }
    
    
    private var isDataPublisher: AnyPublisher<[ImpulseCommentModel.Data], Never> {
        impulseCommentHandler.$impulseCommentDataResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {

                    return []
                }
               
                return (response.data ?? []) as [ImpulseCommentModel.Data]
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
    
    func getImpulseCommentData() {
        impulseCommentHandler.getImpulseCommentData()
    }
    
}



