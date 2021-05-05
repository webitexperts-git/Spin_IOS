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
    
    struct Data : Codable, Hashable {
        let id : String?
        let updated_on : String?
        let hash_title : String?
        let created_on : String?
        let status : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case updated_on = "updated_on"
            case hash_title = "hash_title"
            case created_on = "created_on"
            case status = "status"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            updated_on = try values.decodeIfPresent(String.self, forKey: .updated_on)
            hash_title = try values.decodeIfPresent(String.self, forKey: .hash_title)
            created_on = try values.decodeIfPresent(String.self, forKey: .created_on)
            status = try values.decodeIfPresent(String.self, forKey: .status)
        }

    }
}
