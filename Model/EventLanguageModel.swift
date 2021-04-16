//
//  EventLanguageModel.swift
//  Spine
//
//  Created by Aashita Tyagi on 15/04/21.
//

import Foundation
struct EventLanguageModel : Codable {
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
        let name : String?
        let iso : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case name = "name"
            case iso = "iso"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            iso = try values.decodeIfPresent(String.self, forKey: .iso)
        }

    }


}
