//
//  ActivitiesFollowingModel.swift
//  Spine
//
//  Created by Aashita Tyagi on 04/05/21.
//

import Foundation
struct ActivitiesFollowingModel : Codable {
    let status : Bool?
    let data : [Data]?
    let current_page : String?
    let current_per_page : String?
    let post_image : String?
    let impulse_image : String?
    let profil_image : String?
    let message : String?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case data = "data"
        case current_page = "current_page"
        case current_per_page = "current_per_page"
        case post_image = "post-image"
        case impulse_image = "impulse-image"
        case profil_image = "profil_image"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        data = try values.decodeIfPresent([Data].self, forKey: .data)
        current_page = try values.decodeIfPresent(String.self, forKey: .current_page)
        current_per_page = try values.decodeIfPresent(String.self, forKey: .current_per_page)
        post_image = try values.decodeIfPresent(String.self, forKey: .post_image)
        impulse_image = try values.decodeIfPresent(String.self, forKey: .impulse_image)
        profil_image = try values.decodeIfPresent(String.self, forKey: .profil_image)
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
        let event_location : String?
        let status : String?
        let event_post : String?
        let event_id : String?
        let feature_post : String?
        let feature_post_link : String?
        let feature_admin_approve : String?
        let created_on : String?
        let updated_on : String?
        let user_name_from_id : String?
        let user_display_name_from_id : String?
        let u_name : String?
        let profile_pic : String?
        let tbl : String?
        let tbl_action : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case user_id = "user_id"
            case type = "type"
            case title = "title"
            case hashtag_ids = "hashtag_ids"
            case post_backround_color_id = "post_backround_color_id"
            case multiplity = "multiplity"
            case files = "files"
            case event_location = "event_location"
            case status = "status"
            case event_post = "event_post"
            case event_id = "event_id"
            case feature_post = "feature_post"
            case feature_post_link = "feature_post_link"
            case feature_admin_approve = "feature_admin_approve"
            case created_on = "created_on"
            case updated_on = "updated_on"
            case user_name_from_id = "user_name_from_id"
            case user_display_name_from_id = "user_display_name_from_id"
            case u_name = "u_name"
            case profile_pic = "profile_pic"
            case tbl = "tbl"
            case tbl_action = "tbl_action"
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
            event_location = try values.decodeIfPresent(String.self, forKey: .event_location)
            status = try values.decodeIfPresent(String.self, forKey: .status)
            event_post = try values.decodeIfPresent(String.self, forKey: .event_post)
            event_id = try values.decodeIfPresent(String.self, forKey: .event_id)
            feature_post = try values.decodeIfPresent(String.self, forKey: .feature_post)
            feature_post_link = try values.decodeIfPresent(String.self, forKey: .feature_post_link)
            feature_admin_approve = try values.decodeIfPresent(String.self, forKey: .feature_admin_approve)
            created_on = try values.decodeIfPresent(String.self, forKey: .created_on)
            updated_on = try values.decodeIfPresent(String.self, forKey: .updated_on)
            user_name_from_id = try values.decodeIfPresent(String.self, forKey: .user_name_from_id)
            user_display_name_from_id = try values.decodeIfPresent(String.self, forKey: .user_display_name_from_id)
            u_name = try values.decodeIfPresent(String.self, forKey: .u_name)
            profile_pic = try values.decodeIfPresent(String.self, forKey: .profile_pic)
            tbl = try values.decodeIfPresent(String.self, forKey: .tbl)
            tbl_action = try values.decodeIfPresent(String.self, forKey: .tbl_action)
        }

    }


}
