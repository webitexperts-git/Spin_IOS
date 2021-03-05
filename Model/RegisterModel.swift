
//
//  LoginModel.swift
//  Spine
//
//  Created by apple on 14/12/20.
//

import Foundation
import SwiftUI

struct RegisterModel: Codable {

    let status : Bool?
    let data : Data?
    let message : String?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case data = "data"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        data = try values.decodeIfPresent(Data.self, forKey: .data)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }



struct Data : Codable,Hashable {
    let users_id : String?
    let name : String?
    let town : String?
    let email : String?
    let password : String?
    let verification_pin : String?
    let status : String?
    let account : String?
    let facebook_id : String?
    let facebook_image : String?
    let social_login : String?
    let device_token : String?
    let last_login : String?
    let verify_email : String?
    let referral_code : String?
    let created_on : String?
    let updated_on : String?
    let notify_device_token : String?
    let user_latitude : String?
    let user_longitude : String?
    let notify_device_type : String?
    let account_mode : String?
    let bg_image : String?
    let profile_pic : String?
    let display_name : String?
    let bio : String?
    let category : String?
    let website : String?
    let contact_email : String?
    let business_phone : String?
    let business_address : String?
    let address : String?

    enum CodingKeys: String, CodingKey {

        case users_id = "users_id"
        case name = "name"
        case town = "town"
        case email = "email"
        case password = "password"
        case verification_pin = "verification_pin"
        case status = "status"
        case account = "account"
        case facebook_id = "facebook_id"
        case facebook_image = "facebook_image"
        case social_login = "social_login"
        case device_token = "device_token"
        case last_login = "last_login"
        case verify_email = "verify_email"
        case referral_code = "referral_code"
        case created_on = "created_on"
        case updated_on = "updated_on"
        case notify_device_token = "notify_device_token"
        case user_latitude = "user_latitude"
        case user_longitude = "user_longitude"
        case notify_device_type = "notify_device_type"
        case account_mode = "account_mode"
        case bg_image = "bg_image"
        case profile_pic = "profile_pic"
        case display_name = "display_name"
        case bio = "bio"
        case category = "category"
        case website = "website"
        case contact_email = "contact_email"
        case business_phone = "business_phone"
        case business_address = "business_address"
        case address = "address"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        users_id = try values.decodeIfPresent(String.self, forKey: .users_id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        town = try values.decodeIfPresent(String.self, forKey: .town)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        password = try values.decodeIfPresent(String.self, forKey: .password)
        verification_pin = try values.decodeIfPresent(String.self, forKey: .verification_pin)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        account = try values.decodeIfPresent(String.self, forKey: .account)
        facebook_id = try values.decodeIfPresent(String.self, forKey: .facebook_id)
        facebook_image = try values.decodeIfPresent(String.self, forKey: .facebook_image)
        social_login = try values.decodeIfPresent(String.self, forKey: .social_login)
        device_token = try values.decodeIfPresent(String.self, forKey: .device_token)
        last_login = try values.decodeIfPresent(String.self, forKey: .last_login)
        verify_email = try values.decodeIfPresent(String.self, forKey: .verify_email)
        referral_code = try values.decodeIfPresent(String.self, forKey: .referral_code)
        created_on = try values.decodeIfPresent(String.self, forKey: .created_on)
        updated_on = try values.decodeIfPresent(String.self, forKey: .updated_on)
        notify_device_token = try values.decodeIfPresent(String.self, forKey: .notify_device_token)
        user_latitude = try values.decodeIfPresent(String.self, forKey: .user_latitude)
        user_longitude = try values.decodeIfPresent(String.self, forKey: .user_longitude)
        notify_device_type = try values.decodeIfPresent(String.self, forKey: .notify_device_type)
        account_mode = try values.decodeIfPresent(String.self, forKey: .account_mode)
        bg_image = try values.decodeIfPresent(String.self, forKey: .bg_image)
        profile_pic = try values.decodeIfPresent(String.self, forKey: .profile_pic)
        display_name = try values.decodeIfPresent(String.self, forKey: .display_name)
        bio = try values.decodeIfPresent(String.self, forKey: .bio)
        category = try values.decodeIfPresent(String.self, forKey: .category)
        website = try values.decodeIfPresent(String.self, forKey: .website)
        contact_email = try values.decodeIfPresent(String.self, forKey: .contact_email)
        business_phone = try values.decodeIfPresent(String.self, forKey: .business_phone)
        business_address = try values.decodeIfPresent(String.self, forKey: .business_address)
        address = try values.decodeIfPresent(String.self, forKey: .address)
    }

    }
}


