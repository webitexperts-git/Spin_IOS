//
//  singleton.swift
//  vibboz
//
//  Created by Apple on 21/06/18.
//  Copyright © 2018 Dotzoo. All rights reserved.
//

import UIKit
import Reachability

class singleton: NSObject {
    static var instance : singleton? = nil
    
    class func createSingleton() -> singleton? {
        if instance == nil {
            instance = singleton()
        }
        return instance
    }
    
    // network reachibality
    
    static  let shared = singleton()  // 2. Shared instance

    // 4. Tracks current NetworkStatus (notReachable, reachableViaWiFi, reachableViaWWAN)
    var reachabilityStatus: Reachability.Connection = .unavailable
    
    // 3. Boolean to track network reachability
    var isNetworkAvailable : Bool {
        return reachabilityStatus != .unavailable
    }
  
    // 5. Reachability instance for Network status monitoring
    let reachability = try! Reachability()
    
    @objc func reachabilityChanged(note: Notification) {
        let reachability = note.object as! Reachability

        switch reachability.connection {
        case .wifi:
            print("Reachable via WiFi")
            NotificationCenter.default.post(name: Notification.Name("put"), object: nil)
        case .cellular:
            print("Reachable via Cellular")
            NotificationCenter.default.post(name: Notification.Name("put"), object: nil)
        case .none:
            print("Network not reachable")
           NotificationCenter.default.post(name: Notification.Name("put"), object: "YES")
        case .unavailable:
             print("Network not reachable")
            NotificationCenter.default.post(name: Notification.Name("put"), object: "YES")
        }
    }

    func startMonitoring() {
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: .reachabilityChanged, object: reachability)
        do{
            try reachability.startNotifier()
        }catch{
            print("could not start reachability notifier")
        }
        
    }
    func stopMonitoring(){
        reachability.stopNotifier()
        NotificationCenter.default.removeObserver(self,name: .reachabilityChanged, object: reachability)
    }
}

