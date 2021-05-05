//
//  HashTags.swift
//  Spine
//
//  Created by Aashita Tyagi on 25/02/21.
//

import Foundation
import Combine
import SwiftUI

class HashTags: ObservableObject {
    @Published var hash: String {
        didSet {
            UserDefaults.standard.set(hash, forKey: "hash")
        }
    }
    
    init() {
        self.hash = UserDefaults.standard.object(forKey: "hash") as? String ?? ""
    }
}
