//
//  ActivitiesFollowingViewModel.swift
//  Spine
//
//  Created by Aashita Tyagi on 04/05/21.
//

import Foundation
import SwiftUI
import Combine
import Alamofire


public class ActivitiesFollowingViewModel: ObservableObject, Identifiable {
    
   
    @Published var isLoading = false
    
    @Published var shouldNavigate = false
    
    private var disposables: Set<AnyCancellable> = []
    
    var activitiesHandler = ActivitiesHandler()
    
    @Published var woofUrl = false
    @Published var data:[ActivitiesModel.Data] = []
    
    @Published var profil_image = ""
    

    private var isLoadingPublisher: AnyPublisher<Bool, Never> {
        activitiesHandler.$isLoading
            .receive(on: RunLoop.main)
            .map { $0 }
            .eraseToAnyPublisher()
    }
    
    private var isAuthenticatedPublisher: AnyPublisher<Bool, Never> {
        activitiesHandler.$activitiesResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {
                return false
                }
            return response.status ?? false
        }
        .eraseToAnyPublisher()
    }
    
    private var isEventCurrencyPublisher: AnyPublisher<[ActivitiesModel.Data], Never> {
        activitiesHandler.$activitiesResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {
                return []
                }
                return response.data ?? [] as! [ActivitiesModel.Data]
        }
        .eraseToAnyPublisher()
    }
    
    private var isProfil_imagePublisher: AnyPublisher<String, Never> {
        activitiesHandler.$activitiesResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {
                return ""
                }
                return response.profil_image ?? ""
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
        
        isEventCurrencyPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.data, on: self)
            .store(in: &disposables)
//                print(woofUrl)
        
        isProfil_imagePublisher
            .receive(on: RunLoop.main)
            .assign(to: \.profil_image, on: self)
            .store(in: &disposables)
//                print(woofUrl)
        
    }
    
    func getActivitiesData() {
        activitiesHandler.getActivitiesData()
    }
    
    func getFollowingActivitiesData() {
        activitiesHandler.getFollowingActivitiesData()
    }
    
}






