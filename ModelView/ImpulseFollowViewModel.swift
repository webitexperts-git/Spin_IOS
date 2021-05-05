//
//  ImpulseFollowViewModel.swift
//  Spine
//
//  Created by Aashita Tyagi on 31/03/21.
//

import Foundation
import SwiftUI
import Combine
import Alamofire


public class ImpulseFollowViewModel: ObservableObject, Identifiable {
    
   
    @Published var isLoading = false
    
    @Published var shouldNavigate = false
    
    private var disposables: Set<AnyCancellable> = []
    
    var impulseFollowHandler = ImpulseFollowHandler()
    
    @Published var woofUrl = false
//    @Published var data:[FollowingListModel.Data] = []
//   @Published var imageUrl = ""
    

    private var isLoadingPublisher: AnyPublisher<Bool, Never> {
        impulseFollowHandler.$isLoading
            .receive(on: RunLoop.main)
            .map { $0 }
            .eraseToAnyPublisher()
    }
    
    private var isAuthenticatedPublisher: AnyPublisher<Bool, Never> {
        impulseFollowHandler.$impulseFollowResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {
                return false
                }
            return response.status ?? false
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
        
    }
    
    func getImpulseFollowData(title: String) {
        let title2 = title
        impulseFollowHandler.getImpulseFollowData(title2: title2)
    }
    
}
