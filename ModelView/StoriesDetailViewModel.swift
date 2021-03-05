//
//  StoriesDetailViewModel.swift
//  Spine
//
//  Created by Aashita Tyagi on 12/02/21.
//

import Foundation
import SwiftUI
import Combine
import Alamofire


public class StoriesDetailViewModel: ObservableObject, Identifiable {


    @Published var isLoggedIn = false
    @Published var isLoading = false

    @Published var shouldNavigate = false

    private var disposables: Set<AnyCancellable> = []

    var storiesDetailHandler = StoriesDetailHandler()
    @Published var data:[StoriesDetailModel.Data] = []
    @Published var woofUrl = false



    private var isLoadingPublisher: AnyPublisher<Bool, Never> {
        storiesDetailHandler.$isLoading
            .receive(on: RunLoop.main)
            .map { $0 }
            .eraseToAnyPublisher()
    }

    private var isAuthenticatedPublisher: AnyPublisher<Bool, Never> {
        storiesDetailHandler.$storiesDetailDataResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {
                return false
                }
            return response.status ?? false
        }
        .eraseToAnyPublisher()
    }

    private var isDataPublisher: AnyPublisher<[StoriesDetailModel.Data], Never> {
        storiesDetailHandler.$storiesDetailDataResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {

                    return []
                }
               
                return (response.data ?? []) as [StoriesDetailModel.Data]
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
                print(woofUrl)
        
        isDataPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.data, on: self)
            .store(in: &disposables)
            print("StoriesDetail",data)

    }
    
    func getStoriesDetailData() {
        storiesDetailHandler.getStoriesDetailData()
    }

}



