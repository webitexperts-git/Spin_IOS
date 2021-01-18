//
//  HomeModel.swift
//  Spine
//
//  Created by apple on 04/01/21.
//

import Foundation


struct HomeModel : Codable {
    let status : Bool?
    let data : [Data]?
    let image : String?
    let message : String?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case data = "data"
        case image = "image"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        data = try values.decodeIfPresent([Data].self, forKey: .data)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }
    
    
    struct Data : Codable {
        let id : String?
        var image : String?
        let type : String?
        let name : String?
        let title : String?
        let description : String?
        let status : String?
        let created_on : String?
        let updated_on : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case image = "image"
            case type = "type"
            case name = "name"
            case title = "title"
            case description = "description"
            case status = "status"
            case created_on = "created_on"
            case updated_on = "updated_on"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            image = try values.decodeIfPresent(String.self, forKey: .image)
            type = try values.decodeIfPresent(String.self, forKey: .type)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            title = try values.decodeIfPresent(String.self, forKey: .title)
            description = try values.decodeIfPresent(String.self, forKey: .description)
            status = try values.decodeIfPresent(String.self, forKey: .status)
            created_on = try values.decodeIfPresent(String.self, forKey: .created_on)
            updated_on = try values.decodeIfPresent(String.self, forKey: .updated_on)
        }

    }

 
}
