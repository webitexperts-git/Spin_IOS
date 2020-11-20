//
//  ServiceClassMethods.swift
//  vibboz
//
//  Created by Apple on 07/07/18.
//  Copyright © 2018 Dotzoo. All rights reserved.
//

import UIKit
import Alamofire
import Reachability
import PKHUD


public enum customPut: String {
    case get     = "GET"
    case post    = "POST"
}

class ServiceClassMethods: NSObject {

    static let sharedInstance = ServiceClassMethods()
    private override init() {
    }
     func AlamoRequestNew(method:customPut,serviceString:String,parameters:[String : Any]?,completion: @escaping (_ dict:NSDictionary) -> Void) {
        var json:NSDictionary!
        
        var server = Bool()
        let reachability = try! Reachability()
        switch reachability.connection {
        case .wifi:
            server = true
            break
        case .cellular:
            server = true
            break
        case .none:
            server = false
            break
     
        case .unavailable:
            server = false
            break
                
        }
        
        let modifiedURLString = appConstants.kBASE_URL + serviceString
        print(modifiedURLString)
        
        if server {
            
            let user = "devpankaj"
            let password = "devpankaj"
            let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
            let base64Credentials = credentialData.base64EncodedString(options: [])
            let headers = ["Authorization": "Basic \(base64Credentials)", "X-API-KEY": "123run", "Content-Type": "application/x-www-form-urlencoded"]
            print(headers)
             HUD.show(.progress)
            
            if method == .get {
                Alamofire.request(modifiedURLString as String, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).validate().responseJSON { (response) in
                    if let JSON = response.result.value {
                        print(JSON)
                        json = JSON as!  NSDictionary
                        
                        completion(json)
                        PKHUD.sharedHUD.hide()
                    }else {
                        print("It may be json Error or network error")
                        
                        _ = ["status" : "FAILURE","message" : "It seems network is slow!","requestKey" : serviceString]
                        
//                        completion(json as NSDictionary)
                    }
                }
            }
            if method ==  .post{
                Alamofire.request(modifiedURLString as String, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
                   
                    if let JSON = response.result.value {
                        
                        json = JSON as! NSDictionary
                        
                        completion(json)
                         PKHUD.sharedHUD.hide()
                    }else {
                        print("It may be json Error or network error")
                        
                        _ = ["status" : "FAILURE","message" : "It seems network is slow!","requestKey" : serviceString]
                        
//                        completion(json as NSDictionary)
                    }
                }
            }
            
        } else{
            
//            SVProgressHUD.dismiss()
            // let alert = UIAlertView(title: "No Internet Connection", message: "Make sure your device is connected to the internet.", delegate: nil, cancelButtonTitle: "OK")
            
            //     alert.show()
            print("network error")
        }
    }

    
  /////////////////////////////////////////////////////
    
    
    
     func AlamoRequest(method:String,serviceString:String,parameters:[String : Any]?,completion: @escaping (_ dict:NSDictionary) -> Void) {
        var json:NSDictionary!
        
        var server = Bool()
        let reachability = try! Reachability()
        switch reachability.connection {
        case .wifi:
            server = true
            break
        case .cellular:
            server = true
            break
        case .none:
            server = false
            break
        case .unavailable:
             server = false
            break
        }
        
        let modifiedURLString = appConstants.kBASE_URL + serviceString
       
        if server {
            
            if method == "POST" {
                Alamofire.request(modifiedURLString as String, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
                    if let JSON = response.result.value {
                        
                        json = JSON as! NSDictionary
                        
                        completion(json)
                        
                    }else {
                        print("It may be json Error or network error")
                        
                        _ = ["status" : "FAILURE","message" : "It seems network is slow!","requestKey" : serviceString]
                        
//                        completion(json as NSDictionary)
                    }
                }
            }
        } else{
            
//            SVProgressHUD.dismiss()
            
        
    // let alert = UIAlertView(title: "No Internet Connection", message: "Make sure your device is connected to the internet.", delegate: nil, cancelButtonTitle: "OK")
            
       //     alert.show()
            print("network error")
        }
    }
    //#MARK: -ImageData Service
    
     func AlamoRequestForImage(method:String,serviceString:String,parameters:[String : String]?,imageData : NSData,completion: @escaping (_ result: NSDictionary) -> Void) {
        var json:NSDictionary!
        
        let modifiedURLString = appConstants.kBASE_URL + serviceString
        
        let reachivality = try! Reachability()
        
        var state = true
        switch reachivality.connection {
        case .none:
           state = false
            break
        default:
            break
        }
        
        if state {
            
            if method == "POST" {
                
                // Alamofire.upload
                let url = try! URLRequest(url: URL(string:modifiedURLString as String)!, method: .post, headers: nil)
                
                Alamofire.upload(multipartFormData: { (multipartFormData) in
                    
                    
                    multipartFormData.append(imageData as Data, withName: "profile", fileName: "profile.png", mimeType: "profile/png")
                    
                    
                    for (key, value) in parameters! {
                        
                        multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
                        
                    }
                    
                }, with: url, encodingCompletion: { (result) in
                    
                    switch result {
                        
                    case .success(let upload, _, _):
                        print("s")
                        
                        upload.responseJSON { response in
                            
                            //print(response.request)  // original URL request
                            print(response.response as Any) // URL response
                            // print(response.data)     // server data
                            print(response.result)   // result of response serialization
                            if let JSON = response.result.value {
                                print("JSON: \(JSON)")
                                json = JSON as! NSDictionary
                                completion(json)
                                
                            }else
                            {
                                //  CommonMethod.endKRprogrssHud()
                                
                                print("It may be json Error or network error")
                                
                                let json = ["status" : "FAILURE","message" : "It seems network is slow!","requestKey" : serviceString,]
                                
//                                completion(json as NSDictionary)
                                
                            }
                            
                        }
                        
                        
                    case .failure(let encodingError):
                        
                        //  CommonMethod.endKRprogrssHud()
                        print("It may be json Error or network error")
                        let json = ["status" : "FAILURE","message" : "It seems network is slow!","requestKey" : serviceString]
//                        completion(json as NSDictionary)
                        print(encodingError)
                        
                    }
                    
                    
                })
            }
            else{
                
                
                print("It may be json Error or network error")
                
                let json = ["status" : "FAILURE","message" : "Network Error","requestKey" : serviceString]
                
//                completion(json as NSDictionary)
                
                
            }
            
        }else{
            
//            SVProgressHUD.dismiss()
            print("It may be json Error or network error")
            print("Internet connection FAILED")
            var alert = UIAlertView(title: "No Internet Connection", message: "Make sure your device is connected to the internet.", delegate: nil, cancelButtonTitle: "OK")
            alert.show()
            print("network error")
            
            
        }
        
    }
    
    
    func AlamoRequestFormultipleImage(method:String,serviceString:String,parameters:[String : AnyObject]?, imagegroup1:[NSData],imagegroup2:[NSData],mainImage:NSData,completion: @escaping (_ result: NSDictionary) -> Void) {
        var json:NSDictionary!
        
        let modifiedURLString = appConstants.kBASE_URL + serviceString
        
        if method == "POST" {
            
            // Alamofire.upload
            let url = try! URLRequest(url: URL(string:modifiedURLString as String)!, method: .post, headers: nil)
            
            Alamofire.upload(multipartFormData: { (multipartFormData) in
                
                multipartFormData.append(mainImage as Data, withName:"evimage"
                    , fileName: "evimage.png", mimeType: "evimage/png")
                                
                for i in 0..<imagegroup1.count
                {
                    let imageData = imagegroup1[i]
                    multipartFormData.append(imageData as Data, withName:"image[]"
                        , fileName: String(format:"image%d.jpg",i), mimeType: "image/png")
                    
                }
                
                for i in 0..<imagegroup2.count
                {
                    let imageData = imagegroup2[i]
                    multipartFormData.append(imageData as Data, withName:"image1[]"
                        , fileName: String(format:"image%d.jpg",i), mimeType: "image/png")
                    
                }
                
                
                
                for (key, value) in parameters! {
                    
                    
                    if key == "free" || key == "paid"{
                        
                        let JSON = try? JSONSerialization.data(withJSONObject: value, options: [.prettyPrinted])
                        let jsonPrasatation = String(data: JSON!, encoding: .utf8)
                        multipartFormData.append((jsonPrasatation?.data(using: String.Encoding.utf8)!)!, withName: key)
                        
                    }else{
                        
                        multipartFormData.append(value.data(using: String.Encoding.utf8.rawValue)!, withName: key)
                        
                    }
                    
                }
                
            }, with: url, encodingCompletion: { (result) in
                
                switch result {
                    
                case .success(let upload, _, _):
                    print("s")
                    
                    upload.responseJSON { response in
                        
                        //print(response.request)  // original URL request
                        print(response.response) // URL response
                        // print(response.data)     // server data
                        print(response.result)   // result of response serialization
                        if let JSON = response.result.value {
                            print("JSON: \(JSON)")
                            json = JSON as! NSDictionary
                            completion(json)
                            
                        }else
                        {
                            
                            print("It may be json Error or network error")
                            
                            let json = ["status" : "FAILURE","message" : "There is a no interconnection!","requestKey" : serviceString]
                            
//                            completion(json as NSDictionary)
                            
                        }
                        
                    }
                    
                    
                case .failure(let encodingError):
                    
                    print("It may be json Error or network error")
                    let json = ["status" : "FAILURE","message" : "There is a no interconnection!","requestKey" : serviceString]
//                    completion(json as NSDictionary)
                    print(encodingError)
                    
                }
                
                
            })
        }
            
        else{
            print("It may be json Error or network error")
            
            let json = ["status" : "FAILURE","message" : "Network Error","requestKey" : serviceString]
            
//            completion(json as NSDictionary)
            
            
        }
    }
}
