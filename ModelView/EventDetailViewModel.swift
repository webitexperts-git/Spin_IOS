//
//  EventDetailViewModel.swift
//  Spine
//
//  Created by Aashita Tyagi on 06/04/21.
//

import Foundation
import SwiftUI
import Combine
import Alamofire


public class EventDetailViewModel: ObservableObject, Identifiable {
    
   
    @Published var isLoading = false
    
    @Published var shouldNavigate = false
    
    private var disposables: Set<AnyCancellable> = []
    
    var eventDetailHandler = EventDetailHandler()
    @Published var data:[String:EventDetailModel.Data] = [String: EventDetailModel.Data]()
    @Published var title = ""
    @Published var type = ""
    @Published var imageStr = ""
    @Published var startDate = ""
    @Published var startTime = ""
    @Published var endTime = ""
    @Published var linkOfEvent = ""
    @Published var location = ""
    @Published var description = ""
    @Published var hostDisplayName = ""
    @Published var hostName = ""
    @Published var eventUserId = ""
    @Published var profileImageStr = ""
    @Published var woofUrl = false
    @Published var actualStartDate = ""
    @Published var symbol = ""
    @Published var fee = ""
    @Published var language = ""
    @Published var endDate = ""
  
//    @Publish var imageArr:Any = []
    
    @Published var userDetailFollow = ""


    private var isLoadingPublisher: AnyPublisher<Bool, Never> {
        eventDetailHandler.$isLoading
            .receive(on: RunLoop.main)
            .map { $0 }
            .eraseToAnyPublisher()
    }
    
    private var isAuthenticatedPublisher: AnyPublisher<Bool, Never> {
        eventDetailHandler.$eventDetailResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {
                return false
                }
            return response.status ?? false
        }
        .eraseToAnyPublisher()
    }
    
    private var isDataPublisher: AnyPublisher<String, Never> {
        eventDetailHandler.$eventDetailResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {

                    return ""
                }
               
                return response.data?.title ?? ""
        }
        .eraseToAnyPublisher()
    }
    
    private var isTypePublisher: AnyPublisher<String, Never> {
        eventDetailHandler.$eventDetailResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {

                    return ""
                }
               
                return response.data?.type ?? ""
        }
        .eraseToAnyPublisher()
    }
    
    
    private var isImagePublisher: AnyPublisher<String, Never> {
        eventDetailHandler.$eventDetailResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {

                    return ""
                }
              
                return response.data?.file ?? ""
        }
        .eraseToAnyPublisher()
    }
    
    private var isStartDatePublisher: AnyPublisher<String, Never> {
        eventDetailHandler.$eventDetailResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {

                    return ""
                }
               
                return response.data?.start_date ?? ""
        }
        .eraseToAnyPublisher()
    }
    
    private var isStartTimePublisher: AnyPublisher<String, Never> {
        eventDetailHandler.$eventDetailResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {

                    return ""
                }
               
                return response.data?.start_time ?? ""
        }
        .eraseToAnyPublisher()
    }
    
    private var isEndTimePublisher: AnyPublisher<String, Never> {
        eventDetailHandler.$eventDetailResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {

                    return ""
                }
               
                return response.data?.end_time ?? ""
        }
        .eraseToAnyPublisher()
    }
    
    private var isLinkOfEventPublisher: AnyPublisher<String, Never> {
        eventDetailHandler.$eventDetailResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {

                    return ""
                }
               
                return response.data?.link_of_event ?? ""
        }
        .eraseToAnyPublisher()
    }
    
    private var isLocationPublisher: AnyPublisher<String, Never> {
        eventDetailHandler.$eventDetailResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {

                    return ""
                }
               
                return response.data?.location ?? ""
        }
        .eraseToAnyPublisher()
    }
    
    private var isDescPublisher: AnyPublisher<String, Never> {
        eventDetailHandler.$eventDetailResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {

                    return ""
                }
               
                return response.data?.description ?? ""
        }
        .eraseToAnyPublisher()
    }
    

    
    private var ishostPublisher: AnyPublisher<String, Never> {
        eventDetailHandler.$eventDetailResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {

                    return ""
                }
               
                return response.data?.user_display_name ?? ""
        }
        .eraseToAnyPublisher()
    }
    
    private var ishostNamePublisher: AnyPublisher<String, Never> {
        eventDetailHandler.$eventDetailResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {

                    return ""
                }
               
                return response.data?.use_name ?? ""
        }
        .eraseToAnyPublisher()
    }
    
    private var isEventUserIdPublisher: AnyPublisher<String, Never> {
        eventDetailHandler.$eventDetailResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {

                    return ""
                }
               
                return response.data?.user_id ?? ""
        }
        .eraseToAnyPublisher()
    }
    
    private var isEventactualStartDatePublisher: AnyPublisher<String, Never> {
        eventDetailHandler.$eventDetailResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {

                    return ""
                }
               
                return response.data?.acctual_start_datetime ?? ""
        }
        .eraseToAnyPublisher()
    }
    
    private var isEventProfilePicPublisher: AnyPublisher<String, Never> {
        eventDetailHandler.$eventDetailResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {

                    return ""
                }
               
                return response.data?.profile_pic ?? ""
        }
        .eraseToAnyPublisher()
        
    }
    
    
    private var isEventFeePublisher: AnyPublisher<String, Never> {
        eventDetailHandler.$eventDetailResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {

                    return ""
                }
               
                return response.data?.fee ?? ""
        }
        .eraseToAnyPublisher()
    }
    
    private var isEventFeeSymbolPublisher: AnyPublisher<String, Never> {
        eventDetailHandler.$eventDetailResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {

                    return ""
                }
               
                return response.data?.fee ?? ""
        }
        .eraseToAnyPublisher()
    }
    
    
    private var isEventLanguagePublisher: AnyPublisher<String, Never> {
        eventDetailHandler.$eventDetailResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {

                    return ""
                }
               
                return response.data?.language ?? ""
        }
        .eraseToAnyPublisher()
    }
    
    private var isEndDatePublisher: AnyPublisher<String, Never> {
        eventDetailHandler.$eventDetailResponse
            .receive(on: RunLoop.main)
            .map { response in
                guard let response = response else {

                    return ""
                }
               
                return response.data?.end_date ?? ""
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
            .assign(to: \.title, on: self)
            .store(in: &disposables)
                print(woofUrl)
        
        isImagePublisher
            .receive(on: RunLoop.main)
            .assign(to: \.imageStr, on: self)
            .store(in: &disposables)
                print(imageStr)
        
        isTypePublisher
            .receive(on: RunLoop.main)
            .assign(to: \.type, on: self)
            .store(in: &disposables)
                print(imageStr)
        
        isStartDatePublisher
            .receive(on: RunLoop.main)
            .assign(to: \.startDate, on: self)
            .store(in: &disposables)
                print(startDate)
        
        isStartTimePublisher
            .receive(on: RunLoop.main)
            .assign(to: \.startTime, on: self)
            .store(in: &disposables)
                print(startDate)
        
        isEndTimePublisher
            .receive(on: RunLoop.main)
            .assign(to: \.endTime, on: self)
            .store(in: &disposables)
                print(startDate)
        
        isLinkOfEventPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.linkOfEvent, on: self)
            .store(in: &disposables)
                print(startDate)
        
        isLocationPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.location, on: self)
            .store(in: &disposables)
                print(startDate)
        
        isDescPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.description, on: self)
            .store(in: &disposables)
                print(startDate)
        
        ishostPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.hostDisplayName, on: self)
            .store(in: &disposables)
                print(startDate)
        
        ishostNamePublisher
            .receive(on: RunLoop.main)
            .assign(to: \.hostName, on: self)
            .store(in: &disposables)
                print(startDate)
        
        isEventUserIdPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.eventUserId, on: self)
            .store(in: &disposables)
                print(startDate)
        
        isEventactualStartDatePublisher
            .receive(on: RunLoop.main)
            .assign(to: \.actualStartDate, on: self)
            .store(in: &disposables)
                print(startDate)
        
        isEventProfilePicPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.profileImageStr, on: self)
            .store(in: &disposables)
                print(startDate)
        
        isEventFeePublisher
            .receive(on: RunLoop.main)
            .assign(to: \.fee, on: self)
            .store(in: &disposables)
                print(startDate)
        
        isEventFeeSymbolPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.symbol, on: self)
            .store(in: &disposables)
                print(startDate)
        
        isEventFeeSymbolPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.language, on: self)
            .store(in: &disposables)
                print(startDate)
        
        isEndDatePublisher
            .receive(on: RunLoop.main)
            .assign(to: \.endDate, on: self)
            .store(in: &disposables)
                print(startDate)
        
        UINavigationBar.appearance().barTintColor = .clear
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        
    }
    
    func getEventDetailData() {
        eventDetailHandler.getEventDetailData()
    }
    
}
