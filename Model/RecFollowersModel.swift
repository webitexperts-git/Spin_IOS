//
//  RecFollowersModel.swift
//  Spine
//
//  Created by Aashita Tyagi on 19/02/21.
//

import Foundation

struct RecFollowersModel : Codable {
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
    
    struct Data : Codable, Hashable {
        let user_name : String?
        let profile_pic : String?
        let users_id : String?
        let town : String?

        enum CodingKeys: String, CodingKey {

            case user_name = "user_name"
            case profile_pic = "profile_pic"
            case users_id = "users_id"
            case town = "town"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            user_name = try values.decodeIfPresent(String.self, forKey: .user_name)
            profile_pic = try values.decodeIfPresent(String.self, forKey: .profile_pic)
            users_id = try values.decodeIfPresent(String.self, forKey: .users_id)
            town = try values.decodeIfPresent(String.self, forKey: .town)
        }

    }


}

