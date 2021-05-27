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
    let profil_image : String?
    let image : String?
    let message : String?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case data = "data"
        case current_page = "current_page"
        case current_per_page = "current_per_page"
        case profil_image = "profil_image"
        case image = "image"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        data = try values.decodeIfPresent([Data].self, forKey: .data)
        current_page = try values.decodeIfPresent(String.self, forKey: .current_page)
        current_per_page = try values.decodeIfPresent(String.self, forKey: .current_per_page)
        profil_image = try values.decodeIfPresent(String.self, forKey: .profil_image)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }

    struct Data : Codable, Hashable {
        let id : String?
        let user_id : String?
        let duration : String?
        let duration_type : String?
        let duration_length : String?
        let duration_amount : String?
        let duration_currency : String?
        let timeslot_date : String?
        let timeslot_time : String?
        let ad_type : String?
        let file_type : String?
        let file : String?
        let website : String?
        let promote_your_ad : String?
        let event_title : String?
        let event_type : String?
        let event_start_date : String?
        let event_start_time : String?
        let event_end_date : String?
        let event_end_time : String?
        let event_timezone : String?
        let event_location : String?
        let payment_details : String?
        let pay_by : String?
        let latitude : String?
        let longitude : String?
        let status : String?
        let created_on : String?
        let updated_on : String?
        let type : String?
        let post_user_name : String?
        let post_user_display_name : String?
        let profile_pic : String?
        let account_mode : String?
        let total_comment : String?
        let total_like : String?
        let total_save : String?
        let total_share : String?
        let user_like_status : Int?
        let user_save_status : Int?
        let follow_status : Int?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case user_id = "user_id"
            case duration = "duration"
            case duration_type = "duration_type"
            case duration_length = "duration_length"
            case duration_amount = "duration_amount"
            case duration_currency = "duration_currency"
            case timeslot_date = "timeslot_date"
            case timeslot_time = "timeslot_time"
            case ad_type = "ad_type"
            case file_type = "file_type"
            case file = "file"
            case website = "website"
            case promote_your_ad = "promote_your_ad"
            case event_title = "event_title"
            case event_type = "event_type"
            case event_start_date = "event_start_date"
            case event_start_time = "event_start_time"
            case event_end_date = "event_end_date"
            case event_end_time = "event_end_time"
            case event_timezone = "event_timezone"
            case event_location = "event_location"
            case payment_details = "payment_details"
            case pay_by = "pay_by"
            case latitude = "latitude"
            case longitude = "longitude"
            case status = "status"
            case created_on = "created_on"
            case updated_on = "updated_on"
            case type = "type"
            case post_user_name = "post_user_name"
            case post_user_display_name = "post_user_display_name"
            case profile_pic = "profile_pic"
            case account_mode = "account_mode"
            case total_comment = "total_comment"
            case total_like = "total_like"
            case total_save = "total_save"
            case total_share = "total_share"
            case user_like_status = "user_like_status"
            case user_save_status = "user_save_status"
            case follow_status = "follow_status"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            user_id = try values.decodeIfPresent(String.self, forKey: .user_id)
            duration = try values.decodeIfPresent(String.self, forKey: .duration)
            duration_type = try values.decodeIfPresent(String.self, forKey: .duration_type)
            duration_length = try values.decodeIfPresent(String.self, forKey: .duration_length)
            duration_amount = try values.decodeIfPresent(String.self, forKey: .duration_amount)
            duration_currency = try values.decodeIfPresent(String.self, forKey: .duration_currency)
            timeslot_date = try values.decodeIfPresent(String.self, forKey: .timeslot_date)
            timeslot_time = try values.decodeIfPresent(String.self, forKey: .timeslot_time)
            ad_type = try values.decodeIfPresent(String.self, forKey: .ad_type)
            file_type = try values.decodeIfPresent(String.self, forKey: .file_type)
            file = try values.decodeIfPresent(String.self, forKey: .file)
            website = try values.decodeIfPresent(String.self, forKey: .website)
            promote_your_ad = try values.decodeIfPresent(String.self, forKey: .promote_your_ad)
            event_title = try values.decodeIfPresent(String.self, forKey: .event_title)
            event_type = try values.decodeIfPresent(String.self, forKey: .event_type)
            event_start_date = try values.decodeIfPresent(String.self, forKey: .event_start_date)
            event_start_time = try values.decodeIfPresent(String.self, forKey: .event_start_time)
            event_end_date = try values.decodeIfPresent(String.self, forKey: .event_end_date)
            event_end_time = try values.decodeIfPresent(String.self, forKey: .event_end_time)
            event_timezone = try values.decodeIfPresent(String.self, forKey: .event_timezone)
            event_location = try values.decodeIfPresent(String.self, forKey: .event_location)
            payment_details = try values.decodeIfPresent(String.self, forKey: .payment_details)
            pay_by = try values.decodeIfPresent(String.self, forKey: .pay_by)
            latitude = try values.decodeIfPresent(String.self, forKey: .latitude)
            longitude = try values.decodeIfPresent(String.self, forKey: .longitude)
            status = try values.decodeIfPresent(String.self, forKey: .status)
            created_on = try values.decodeIfPresent(String.self, forKey: .created_on)
            updated_on = try values.decodeIfPresent(String.self, forKey: .updated_on)
            type = try values.decodeIfPresent(String.self, forKey: .type)
            post_user_name = try values.decodeIfPresent(String.self, forKey: .post_user_name)
            post_user_display_name = try values.decodeIfPresent(String.self, forKey: .post_user_display_name)
            profile_pic = try values.decodeIfPresent(String.self, forKey: .profile_pic)
            account_mode = try values.decodeIfPresent(String.self, forKey: .account_mode)
            total_comment = try values.decodeIfPresent(String.self, forKey: .total_comment)
            total_like = try values.decodeIfPresent(String.self, forKey: .total_like)
            total_save = try values.decodeIfPresent(String.self, forKey: .total_save)
            total_share = try values.decodeIfPresent(String.self, forKey: .total_share)
            user_like_status = try values.decodeIfPresent(Int.self, forKey: .user_like_status)
            user_save_status = try values.decodeIfPresent(Int.self, forKey: .user_save_status)
            follow_status = try values.decodeIfPresent(Int.self, forKey: .follow_status)
        }

    }
}
