//
//  RegisterModel.swift
//  Spine
//
//  Created by apple on 24/12/20.
//

import Foundation
import SwiftUI

public class RegisterModel: Codable, Identifiable {
    public let userID: Int
    public let name: String
    public let town: String
    public let email: String
    public let status: Bool
    
    enum CodingKeys: String, CodingKey {
        case userID = "users_id"
        case name = "name"
        case town = "town"
        case email = "email"
        case status = "status"
    }
    
    public init(userID: Int, name: String, town: String, email: String, status: Bool) {
        self.userID = userID
        self.name = name
        self.town = town
        self.email = email
        self.status = status
    }
}

public typealias Registers = [RegisterModel]

