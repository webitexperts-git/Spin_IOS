//
//  EmailVerificationViewModel.swift
//  Spine
//
//  Created by Aashita Tyagi on 03/03/21.
//

import Foundation
import Combine
import Alamofire


public class EmailVerificationViewModel: ObservableObject, Identifiable {
    
    
    @Published var data:[EmailVerificationModel.Data] = []
    
    @Published var isLoggedIn = false
    @Published var isLoading = false
    
    @Published var shouldNavigate = false
    
    private var disposables: Set<AnyCancellable> = []
    
    var emailVerificationHandler = EmailVerificationHandler()
    var uu = RegisterHandler()
    
    @Published var woofUrl = false
//    @Published var data:[RecFollowersModel.Data] = []
//    @Published var userId:String
    

    private var isLoadingPublisher: AnyPublisher<Bool, Never> {
        emailVerificationHandler.$isLoading
            .receive(on: RunLoop.main)
            .map { $0 }
            .eraseToAnyPublisher()
    }
    
    private var isAuthenticatedPublisher: AnyPublisher<Bool, Never> {
        emailVerificationHandler.$emailVerificationDataResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {
                return false
                }
            return response.status ?? false
        }
        .eraseToAnyPublisher()
    }
    
    
//    private var isDataPublisher: AnyPublisher<String, Never> {
//        emailVerificationHandler.$emailVerificationDataResponse
//            .receive(on: RunLoop.main)
//            .map { response in
//                guard let response = response else {
//
//                    return ""
//                }
//
//                return (response.data?.users_id ?? "")
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
        
        
//        isDataPublisher
//            .receive(on: RunLoop.main)
//            .assign(to: \.userId, on: self)
//            .store(in: &disposables)
//            print("HomeViewImpulseModelData",userId)
        
    }
    
    func getEmailVerificationData() {
        print(uu.woofResponse1?.data?.users_id! as Any)
        emailVerificationHandler.getEmailVerificationData(userId: uu.woofResponse1?.data?.users_id ?? "")
    }
    
}

