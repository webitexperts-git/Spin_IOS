//
//  ImpulseLikeViewModel.swift
//  Spine
//
//  Created by Aashita Tyagi on 31/03/21.
//

import Foundation
import SwiftUI
import Combine
import Alamofire


public class ImpulseLikeViewModel: ObservableObject, Identifiable {
    
   
    @Published var isLoading = false
    
    @Published var shouldNavigate = false
    
    private var disposables: Set<AnyCancellable> = []
    
    var impulseLikeHandler = ImpulseLikeHandler()
//    @Published var data:[UserDetailModel.Data] = []
    @Published var woofUrl = false
    
    @Published var userDetailFollow = ""
//    @Published var data:[FollowingListModel.Data] = []
//   @Published var imageUrl = ""
    

    private var isLoadingPublisher: AnyPublisher<Bool, Never> {
        impulseLikeHandler.$isLoading
            .receive(on: RunLoop.main)
            .map { $0 }
            .eraseToAnyPublisher()
    }
    
    private var isAuthenticatedPublisher: AnyPublisher<Bool, Never> {
        impulseLikeHandler.$impulseLikeResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {
                return false
                }
            return response.status ?? false
        }
        .eraseToAnyPublisher()
    }
    
//    private var isUserDetailPublisher: AnyPublisher<String, Never> {
//        impulseLikeHandler.impulseLikeResponse
//            .receive(on: RunLoop.main)
//            .map { response in
//                guard let response = response else {
//                return ""
//                }
//                return response.data?.impulse_follow ?? ""
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
        
//        isUserDetailPublisher
//            .receive(on: RunLoop.main)
//            .assign(to: \.userDetailFollow, on: self)
//            .store(in: &disposables)
//                print(woofUrl)
        
    }
    
    func getUserDetailData() {
        impulseLikeHandler.getImpulseLikeData()
    }
    
}
