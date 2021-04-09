//
//  ImpulseFollow.swift
//  Spine
//
//  Created by Aashita Tyagi on 31/03/21.
//

import Foundation
import Combine

struct ImpulseFollow : Codable {
    let status : Bool?
    let message : String?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }
}
