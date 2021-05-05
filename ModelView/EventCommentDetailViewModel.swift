//
//  EventCommentDetailViewModel.swift
//  Spine
//
//  Created by Aashita Tyagi on 09/04/21.
//

import Foundation
import SwiftUI
import Combine
import Alamofire


public class EventCommentDetailViewModel: ObservableObject, Identifiable {
    
   
    @Published var isLoading = false
    
    @Published var shouldNavigate = false
    
    private var disposables: Set<AnyCancellable> = []
    
    var eventCommentDetailHandler = EventCommentDetailHandler()
    
    @Published var woofUrl = false
    @Published var data:[EventCommentDetailModel.Data] = []
    
    

    private var isLoadingPublisher: AnyPublisher<Bool, Never> {
        eventCommentDetailHandler.$isLoading
            .receive(on: RunLoop.main)
            .map { $0 }
            .eraseToAnyPublisher()
    }
    
    private var isAuthenticatedPublisher: AnyPublisher<Bool, Never> {
        eventCommentDetailHandler.$eventCommentDetailResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {
                return false
                }
            return response.status ?? false
        }
        .eraseToAnyPublisher()
    }
    
    
    private var isDataPublisher: AnyPublisher<[EventCommentDetailModel.Data], Never> {
        eventCommentDetailHandler.$eventCommentDetailResponse
            .receive(on: RunLoop.main)
            .map { response in
                let response = response
               
                return (response?.data ?? []) as [EventCommentDetailModel.Data]
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
    }
    
    func getEventCommentDetailData() {
        eventCommentDetailHandler.getEventCommentDetailData()
    }
    
}




