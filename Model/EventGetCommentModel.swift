//
//  EventGetComment.swift
//  Spine
//
//  Created by Aashita Tyagi on 08/04/21.
//

import Foundation

struct EventGetCommentModel : Codable {
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
        let spine_event_id : String?
        let user_id : String?
        let parent_comment_id : String?
        let comment : String?
        let created_on : String?
        let post_user_name : String?
        let post_user_display_name : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case spine_event_id = "spine_event_id"
            case user_id = "user_id"
            case parent_comment_id = "parent_comment_id"
            case comment = "comment"
            case created_on = "created_on"
            case post_user_name = "post_user_name"
            case post_user_display_name = "post_user_display_name"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            spine_event_id = try values.decodeIfPresent(String.self, forKey: .spine_event_id)
            user_id = try values.decodeIfPresent(String.self, forKey: .user_id)
            parent_comment_id = try values.decodeIfPresent(String.self, forKey: .parent_comment_id)
            comment = try values.decodeIfPresent(String.self, forKey: .comment)
            created_on = try values.decodeIfPresent(String.self, forKey: .created_on)
            post_user_name = try values.decodeIfPresent(String.self, forKey: .post_user_name)
            post_user_display_name = try values.decodeIfPresent(String.self, forKey: .post_user_display_name)
        }

    }


}
