//
//  TrendingCatViewModel.swift
//  Spine
//
//  Created by apple on 18/01/21.
//

import Foundation
import SwiftUI
import Combine
import Alamofire


public class FavouritViewModel: ObservableObject, Identifiable {


    @Published var isLoggedIn = false
    @Published var isLoading = false

    @Published var shouldNavigate = false

    private var disposables: Set<AnyCancellable> = []

    var favouriteHandler = FavouritPostHandler()

    @Published var woofUrl = false
//    @Published var data = [TrendinFgCatModel.Data]()


    private var isLoadingPublisher: AnyPublisher<Bool, Never> {
        favouriteHandler.$isLoading
            .receive(on: RunLoop.main)
            .map { $0 }
            .eraseToAnyPublisher()
    }

    private var isAuthenticatedPublisher: AnyPublisher<Bool, Never> {
        favouriteHandler.$favouritPostDataResponse
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
    
    func getFavouriteData(id: String) {
        favouriteHandler.getFavouriteData(id:id)
    }

}



