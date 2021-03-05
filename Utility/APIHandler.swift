//
//  APIHandler.swift
//  LoginWithSwiftUIDemo
//
//  Created by Lawrence Tan on 4/4/20.
//  Copyright © 2020 Lawrence Tan. All rights reserved.
//

import Alamofire
import Combine
import UIKit
import Foundation

class APIHandler {
        
    var statusCode = Int.zero
    
    func handleResponse<T: Decodable>(_ response: DataResponse<T, AFError>) -> Any? {
        switch response.result {
        case .success:
            print(response.value)
            return response.value
            
        case .failure:
            return nil
        }
    }
    
    
    func alertAction(message:String){

        let alertView = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        var rootViewController = UIApplication.shared.keyWindow?.rootViewController
               let alertAction = UIAlertAction(title: "ok", style: .cancel) { (alert) in
                rootViewController?.dismiss(animated: true, completion: nil)
               }
               alertView.addAction(alertAction)
                rootViewController?.present(alertView, animated: true, completion: nil)
    }
}
