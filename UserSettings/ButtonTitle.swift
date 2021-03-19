//
//  ButtonTitle.swift
//  Spine
//
//  Created by Aashita Tyagi on 11/03/21.
//

import Foundation
import Combine
import SwiftUI

class ButtonTitle: ObservableObject {
    @Published var title: String {
        didSet {
            title = ""
        }
    }
    
    init() {
        self.title = ""
    }
}
