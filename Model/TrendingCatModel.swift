//
//  TrendingCatModel.swift
//  Spine
//
//  Created by apple on 18/01/21.
//

import Foundation

struct TrendingCatModel : Codable {
    let status : Bool?
    let data : [Data]?
    let message : String?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case data = "data"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        data = try values.decodeIfPresent([Data].self, forKey: .data)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }
    
    struct Data : Codable {
        let id : String?
        let users_id : String?
        let hash_title : String?
        let created_on : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case users_id = "users_id"
            case hash_title = "hash_title"
            case created_on = "created_on"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            users_id = try values.decodeIfPresent(String.self, forKey: .users_id)
            hash_title = try values.decodeIfPresent(String.self, forKey: .hash_title)
            created_on = try values.decodeIfPresent(String.self, forKey: .created_on)
        }

    }
}
