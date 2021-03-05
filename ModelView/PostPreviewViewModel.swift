//
//  PostPreviewViewModel.swift
//  Spine
//
//  Created by Aashita Tyagi on 25/02/21.
//

import Foundation
import SwiftUI
import Combine
import Alamofire


public class PostPreviewViewModel: ObservableObject, Identifiable {
    
    @Published var email = ""
    
    @Published var isLoggedIn = false
    @Published var isLoading = false
    
    @Published var shouldNavigate = false
    
    private var disposables: Set<AnyCancellable> = []
    
    var postPreviewHandler = PostPreviewHandler()
    
    @Published var woofUrl = false
//    @Published var data:[RecFollowersModel.Data] = []
   
    

    private var isLoadingPublisher: AnyPublisher<Bool, Never> {
        postPreviewHandler.$isLoading
            .receive(on: RunLoop.main)
            .map { $0 }
            .eraseToAnyPublisher()
    }
    
    private var isAuthenticatedPublisher: AnyPublisher<Bool, Never> {
        postPreviewHandler.$postDataResponse
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
    
    func getPostData() {
        postPreviewHandler.getPostData()
    }
    
}
