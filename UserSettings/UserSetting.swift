//
//  UserSettings.swift
//  Spine
//
//  Created by Aashita Tyagi on 25/02/21.
//

import Foundation
import Combine
import SwiftUI

class UserSetting: ObservableObject {
    @Published var post: String {
        didSet {
            UserDefaults.standard.set(post, forKey: "post")
        }
    }
    
    init() {
        self.post = UserDefaults.standard.object(forKey: "post") as? String ?? ""
    }
}


extension UserDefaults {

    func color(forKey key: String) -> UIColor? {
        var color: UIColor?
        if let colorData = data(forKey: key) {
            color = NSKeyedUnarchiver.unarchiveObject(with: colorData) as? UIColor
        }
        return color
    }

    func set(_ value: UIColor?, forKey key: String) {
        var colorData: Data?
        if let color = value {
            colorData = NSKeyedArchiver.archivedData(withRootObject: color)
        }
        set(colorData, forKey: key)
    }

}
