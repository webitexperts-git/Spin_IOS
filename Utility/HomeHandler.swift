//
//  HomeHandler.swift
//  Spine
//
//  Created by apple on 06/01/21.
//

import Foundation
import Combine
import Alamofire

class HomeHandler: APIHandler{
    @Published var homeWelcomeDataResponse: HomeModel?
    @Published var isLoading = false
            
    func getHomeWelcomeData() {
        isLoading = true
        
        let url = "http://wiesoftware.com/spine/apisecure/other/getWelcomeData"
        
        AF.request(url, method: .get).responseDecodable { [weak self] (response: DataResponse<HomeModel, AFError>) in
            guard let weakSelf = self else { return }
            
            guard let response = weakSelf.handleResponse(response) as? HomeModel else {
                weakSelf.isLoading = false
                return
            }
                            
            weakSelf.isLoading = false
            weakSelf.homeWelcomeDataResponse = response
        }
    }
    
    func getHomeImpulseData() {
        isLoading = true
        
        let url = "http://wiesoftware.com/spine/apisecure/other/getWelcomeData"
        
        AF.request(url, method: .get).responseDecodable { [weak self] (response: DataResponse<HomeModel, AFError>) in
            guard let weakSelf = self else { return }
            
            guard let response = weakSelf.handleResponse(response) as? HomeModel else {
                weakSelf.isLoading = false
                return
            }
                            
            weakSelf.isLoading = false
            weakSelf.homeWelcomeDataResponse = response
        }
    }
    
    
}
