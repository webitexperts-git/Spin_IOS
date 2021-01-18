//
//  HomeImpulseModel.swift
//  Spine
//
//  Created by apple on 15/01/21.
//

import Foundation


struct HomeImpulseModel: Codable {
    
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
    
    
    struct Data : Codable {
        let id : String?
        let image : String?
        let name : String?
        let description : String?
        let status : String?
        let created_on : String?
        let updated_on : String?
        let total_comment : String?
        let total_like : String?
        let total_save : String?
        let total_share : String?
        let user_like_status : Int?
        let user_save_status : Int?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case image = "image"
            case name = "name"
            case description = "description"
            case status = "status"
            case created_on = "created_on"
            case updated_on = "updated_on"
            case total_comment = "total_comment"
            case total_like = "total_like"
            case total_save = "total_save"
            case total_share = "total_share"
            case user_like_status = "user_like_status"
            case user_save_status = "user_save_status"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            image = try values.decodeIfPresent(String.self, forKey: .image)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            description = try values.decodeIfPresent(String.self, forKey: .description)
            status = try values.decodeIfPresent(String.self, forKey: .status)
            created_on = try values.decodeIfPresent(String.self, forKey: .created_on)
            updated_on = try values.decodeIfPresent(String.self, forKey: .updated_on)
            total_comment = try values.decodeIfPresent(String.self, forKey: .total_comment)
            total_like = try values.decodeIfPresent(String.self, forKey: .total_like)
            total_save = try values.decodeIfPresent(String.self, forKey: .total_save)
            total_share = try values.decodeIfPresent(String.self, forKey: .total_share)
            user_like_status = try values.decodeIfPresent(Int.self, forKey: .user_like_status)
            user_save_status = try values.decodeIfPresent(Int.self, forKey: .user_save_status)
        }

    }


    }
