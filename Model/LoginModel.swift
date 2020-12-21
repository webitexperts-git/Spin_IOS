//
//  LoginModel.swift
//  Spine
//
//  Created by apple on 14/12/20.
//

import Foundation
import SwiftUI

public class LoginModel: Codable, Identifiable {
    public let userID: Int
    public let id: Int
    public let title: String
    public let completed: Bool
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id = "id"
        case title = "title"
        case completed = "completed"
    }
    
    public init(userID: Int, id: Int, title: String, completed: Bool) {
        self.userID = userID
        self.id = id
        self.title = title
        self.completed = completed
    }
}

public typealias Logins = [LoginModel]
