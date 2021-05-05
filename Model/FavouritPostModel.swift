//
//  FavouritPostModel.swift
//  Spine
//
//  Created by apple on 19/01/21.
//

import Foundation


struct FavouritPostModel : Codable {
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
