//
//  PostColor.swift
//  Spine
//
//  Created by Aashita Tyagi on 25/02/21.
//

import Foundation
import Combine

class PostColor: ObservableObject {
    @Published var pColor: String {
        didSet {
            UserDefaults.standard.set(pColor, forKey: "postColor")
        }
    }
    
    init() {
        self.pColor = UserDefaults.standard.object(forKey: "postColor") as? String ?? ""
    }
}

