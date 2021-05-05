//
//  EventGoingModel.swift
//  Spine
//
//  Created by Aashita Tyagi on 07/04/21.
//

import Foundation

struct EventGoingModel : Codable {
    let status : Bool?
    let data : Data?
    let image : String?
    let profile_image : String?
    let message : String?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case data = "data"
        case image = "image"
        case profile_image = "profile_image"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        data = try values.decodeIfPresent(Data.self, forKey: .data)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        profile_image = try values.decodeIfPresent(String.self, forKey: .profile_image)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }
    
    struct Data : Codable, Hashable {
        let id : String?
        let user_id : String?
        let title : String?
        let file : String?
        let multiple : String?
        let type : String?
        let user_list : [User_list]?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case user_id = "user_id"
            case title = "title"
            case file = "file"
            case multiple = "multiple"
            case type = "type"
            case user_list = "user_list"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            user_id = try values.decodeIfPresent(String.self, forKey: .user_id)
            title = try values.decodeIfPresent(String.self, forKey: .title)
            file = try values.decodeIfPresent(String.self, forKey: .file)
            multiple = try values.decodeIfPresent(String.self, forKey: .multiple)
            type = try values.decodeIfPresent(String.self, forKey: .type)
            user_list = try values.decodeIfPresent([User_list].self, forKey: .user_list)
        }

    }
    struct User_list : Codable, Hashable {
        let users_id : String?
        let name : String?
        let display_name : String?
        let town : String?
        let email : String?
        let bio : String?
        let profile_pic : String?
        let message : String?
        let booking_status : String?

        enum CodingKeys: String, CodingKey {

            case users_id = "users_id"
            case name = "name"
            case display_name = "display_name"
            case town = "town"
            case email = "email"
            case bio = "bio"
            case profile_pic = "profile_pic"
            case message = "message"
            case booking_status = "booking_status"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            users_id = try values.decodeIfPresent(String.self, forKey: .users_id)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            display_name = try values.decodeIfPresent(String.self, forKey: .display_name)
            town = try values.decodeIfPresent(String.self, forKey: .town)
            email = try values.decodeIfPresent(String.self, forKey: .email)
            bio = try values.decodeIfPresent(String.self, forKey: .bio)
            profile_pic = try values.decodeIfPresent(String.self, forKey: .profile_pic)
            message = try values.decodeIfPresent(String.self, forKey: .message)
            booking_status = try values.decodeIfPresent(String.self, forKey: .booking_status)
        }

    }


}
