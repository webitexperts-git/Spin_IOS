//
//  EventCategoryModel.swift
//  Spine
//
//  Created by Aashita Tyagi on 13/04/21.
//

import Foundation
struct EventCategoryModel : Codable {
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
        let category_name : String?
        let status : String?
        let created_on : String?
        let updated_on : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case category_name = "category_name"
            case status = "status"
            case created_on = "created_on"
            case updated_on = "updated_on"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            category_name = try values.decodeIfPresent(String.self, forKey: .category_name)
            status = try values.decodeIfPresent(String.self, forKey: .status)
            created_on = try values.decodeIfPresent(String.self, forKey: .created_on)
            updated_on = try values.decodeIfPresent(String.self, forKey: .updated_on)
        }

    }


}
