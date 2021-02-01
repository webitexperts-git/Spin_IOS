//
//  FollowersModel.swift
//  Spine
//
//  Created by apple on 18/01/21.
//

import Foundation

struct FollowersModel : Codable {
    let status : Bool?
    let total : String?
    let data : [Data]?
    let current_page : String?
    let current_per_page : String?
    let image : String?
    let message : String?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case total = "total"
        case data = "data"
        case current_page = "current_page"
        case current_per_page = "current_per_page"
        case image = "image"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        total = try values.decodeIfPresent(String.self, forKey: .total)
        data = try values.decodeIfPresent([Data].self, forKey: .data)
        current_page = try values.decodeIfPresent(String.self, forKey: .current_page)
        current_per_page = try values.decodeIfPresent(String.self, forKey: .current_per_page)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }
    
    struct Data : Codable {
        let tbl_users_user_id : String?
        let tbl_users_user_name : String?
        let id : String?
        let user_id : String?
        let follow_user_id : String?
        let private_req : String?
        let created_on : String?

        enum CodingKeys: String, CodingKey {

            case tbl_users_user_id = "tbl_users_user_id"
            case tbl_users_user_name = "tbl_users_user_name"
            case id = "id"
            case user_id = "user_id"
            case follow_user_id = "follow_user_id"
            case private_req = "private_req"
            case created_on = "created_on"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            tbl_users_user_id = try values.decodeIfPresent(String.self, forKey: .tbl_users_user_id)
            tbl_users_user_name = try values.decodeIfPresent(String.self, forKey: .tbl_users_user_name)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            user_id = try values.decodeIfPresent(String.self, forKey: .user_id)
            follow_user_id = try values.decodeIfPresent(String.self, forKey: .follow_user_id)
            private_req = try values.decodeIfPresent(String.self, forKey: .private_req)
            created_on = try values.decodeIfPresent(String.self, forKey: .created_on)
        }

    }


}
