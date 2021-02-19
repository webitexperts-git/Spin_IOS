//
//  ImpulseCommentModel.swift
//  Spine
//
//  Created by Aashita Tyagi on 17/02/21.
//

import Foundation

struct ImpulseCommentModel : Codable {
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
        let spine_impluse_id : String?
        let user_id : String?
        let parent_comment_id : String?
        let comment : String?
        let created_on : String?
        let name : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case spine_impluse_id = "spine_impluse_id"
            case user_id = "user_id"
            case parent_comment_id = "parent_comment_id"
            case comment = "comment"
            case created_on = "created_on"
            case name = "name"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            spine_impluse_id = try values.decodeIfPresent(String.self, forKey: .spine_impluse_id)
            user_id = try values.decodeIfPresent(String.self, forKey: .user_id)
            parent_comment_id = try values.decodeIfPresent(String.self, forKey: .parent_comment_id)
            comment = try values.decodeIfPresent(String.self, forKey: .comment)
            created_on = try values.decodeIfPresent(String.self, forKey: .created_on)
            name = try values.decodeIfPresent(String.self, forKey: .name)
        }

    }


}
