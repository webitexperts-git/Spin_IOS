//
//  StoriesModel.swift
//  Spine
//
//  Created by apple on 18/01/21.
//

import Foundation

struct StoriesModel : Codable {
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
        let user_id : String?
        let type : String?
        let media_file : String?
        let title : String?
        let allow_comment : String?
        let delete_story_after_24_hr : String?
        let created_on : String?
        let removed_time : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case user_id = "user_id"
            case type = "type"
            case media_file = "media_file"
            case title = "title"
            case allow_comment = "allow_comment"
            case delete_story_after_24_hr = "delete_story_after_24_hr"
            case created_on = "created_on"
            case removed_time = "removed_time"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            user_id = try values.decodeIfPresent(String.self, forKey: .user_id)
            type = try values.decodeIfPresent(String.self, forKey: .type)
            media_file = try values.decodeIfPresent(String.self, forKey: .media_file)
            title = try values.decodeIfPresent(String.self, forKey: .title)
            allow_comment = try values.decodeIfPresent(String.self, forKey: .allow_comment)
            delete_story_after_24_hr = try values.decodeIfPresent(String.self, forKey: .delete_story_after_24_hr)
            created_on = try values.decodeIfPresent(String.self, forKey: .created_on)
            removed_time = try values.decodeIfPresent(String.self, forKey: .removed_time)
        }

    }


}
