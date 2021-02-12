//
//  UserPostModel.swift
//  Spine
//
//  Created by Aashita Tyagi on 08/02/21.
//

import Foundation
struct UserPostModel : Codable {
    let status : Bool?
    let data : [Data]?
    let current_page : String?
    let current_per_page : String?
    let image : String?
    let message : String?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case data = "data"
        case current_page = "current_page"
        case current_per_page = "current_per_page"
        case image = "image"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        data = try values.decodeIfPresent([Data].self, forKey: .data)
        current_page = try values.decodeIfPresent(String.self, forKey: .current_page)
        current_per_page = try values.decodeIfPresent(String.self, forKey: .current_per_page)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }
    
    
    struct Data : Codable, Hashable {
        let id : String?
        let user_id : String?
        let type : String?
        let title : String?
        let hashtag_ids : String?
        let post_backround_color_id : String?
        let multiplity : String?
        let files : String?
        let status : String?
        let created_on : String?
        let updated_on : String?
        let post_user_name : String?
        let total_comment : String?
        let total_like : String?
        let total_save : String?
        let total_share : String?
        let user_like_status : Int?
        let user_save_status : Int?
        let profile_pic : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case user_id = "user_id"
            case type = "type"
            case title = "title"
            case hashtag_ids = "hashtag_ids"
            case post_backround_color_id = "post_backround_color_id"
            case multiplity = "multiplity"
            case files = "files"
            case status = "status"
            case created_on = "created_on"
            case updated_on = "updated_on"
            case post_user_name = "post_user_name"
            case total_comment = "total_comment"
            case total_like = "total_like"
            case total_save = "total_save"
            case total_share = "total_share"
            case user_like_status = "user_like_status"
            case user_save_status = "user_save_status"
            case profile_pic = "profile_pic"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            user_id = try values.decodeIfPresent(String.self, forKey: .user_id)
            type = try values.decodeIfPresent(String.self, forKey: .type)
            title = try values.decodeIfPresent(String.self, forKey: .title)
            hashtag_ids = try values.decodeIfPresent(String.self, forKey: .hashtag_ids)
            post_backround_color_id = try values.decodeIfPresent(String.self, forKey: .post_backround_color_id)
            multiplity = try values.decodeIfPresent(String.self, forKey: .multiplity)
            files = try values.decodeIfPresent(String.self, forKey: .files)
            status = try values.decodeIfPresent(String.self, forKey: .status)
            created_on = try values.decodeIfPresent(String.self, forKey: .created_on)
            updated_on = try values.decodeIfPresent(String.self, forKey: .updated_on)
            post_user_name = try values.decodeIfPresent(String.self, forKey: .post_user_name)
            total_comment = try values.decodeIfPresent(String.self, forKey: .total_comment)
            total_like = try values.decodeIfPresent(String.self, forKey: .total_like)
            total_save = try values.decodeIfPresent(String.self, forKey: .total_save)
            total_share = try values.decodeIfPresent(String.self, forKey: .total_share)
            user_like_status = try values.decodeIfPresent(Int.self, forKey: .user_like_status)
            user_save_status = try values.decodeIfPresent(Int.self, forKey: .user_save_status)
            profile_pic = try values.decodeIfPresent(String.self, forKey: .profile_pic)
        }

    }


}
