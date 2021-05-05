//
//  FollowingListViewModel.swift
//  Spine
//
//  Created by Aashita Tyagi on 05/03/21.
//

import Foundation
import SwiftUI
import Combine
import Alamofire


public class FollowingListViewModel: ObservableObject, Identifiable {
    
   
    @Published var isLoading = false
    
    @Published var shouldNavigate = false
    
    private var disposables: Set<AnyCancellable> = []
    
    var followingListHandler = FollowingListHandler()
    
    @Published var woofUrl = false
    @Published var data:[FollowingListModel.Data] = []
   @Published var imageUrl = ""
    

    private var isLoadingPublisher: AnyPublisher<Bool, Never> {
        followingListHandler.$isLoading
            .receive(on: RunLoop.main)
            .map { $0 }
            .eraseToAnyPublisher()
    }
    
    private var isAuthenticatedPublisher: AnyPublisher<Bool, Never> {
        followingListHandler.$followingListResponse
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
        followingListHandler.$followingListResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {
                return ""
                }
            return response.image ?? ""
        }
        .eraseToAnyPublisher()
    }
    
    
    private var isDataPublisher: AnyPublisher<[FollowingListModel.Data], Never> {
        followingListHandler.$followingListResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {

                    return []
                }
               
                return (response.data ?? []) as [FollowingListModel.Data]
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
            print("FollowersDetail",data)
        
        isImageUrl
            .receive(on: RunLoop.main)
            .assign(to: \.imageUrl, on: self)
            .store(in: &disposables)
            print("FollowersDetail",data)
    }
    
    func getFollowingListData() {
        followingListHandler.getFollowingListData()
    }
    
}




