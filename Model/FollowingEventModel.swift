//
//  FollowingEventModel.swift
//  Spine
//
//  Created by Aashita Tyagi on 06/04/21.
//

import Foundation

struct FollowingEventModel : Codable {
var status : Bool?
var data : [Data]?
var current_page : String?
var current_per_page : String?
var image : String?
var message : String?

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
    var start_date : String?
    var records : [Records]?

    enum CodingKeys: String, CodingKey {

        case start_date = "start_date"
        case records = "records"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        start_date = try values.decodeIfPresent(String.self, forKey: .start_date)
        records = try values.decodeIfPresent([Records].self, forKey: .records)
    }

}

struct Records : Codable, Hashable {
    let id : String?
    let user_id : String?
    let title : String?
    let file : String?
    let multiple : String?
    let type : String?
    let start_time : String?
    let start_date : String?
    let end_time : String?
    let end_date : String?
    let acctual_start_datetime : String?
    let acctual_end_datetime : String?
    let timezone : String?
    let location : String?
    let latitude : String?
    let longitude : String?
    let link_of_event : String?
    let description : String?
    let event_categories : String?
    let fee : String?
    let fee_currency : String?
    let max_attendees : String?
    let language : String?
    let accept_participants : String?
    let allow_comments : String?
    let status : String?
    let created_on : String?
    let updated_on : String?
    let use_name : String?
    let use_display_name : String?
    let total_comment : String?
    let total_save : String?
    let total_share : String?
    let user_share_status : Int?
    let user_save_status : Int?
    let symbol : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case user_id = "user_id"
        case title = "title"
        case file = "file"
        case multiple = "multiple"
        case type = "type"
        case start_time = "start_time"
        case start_date = "start_date"
        case end_time = "end_time"
        case end_date = "end_date"
        case acctual_start_datetime = "acctual_start_datetime"
        case acctual_end_datetime = "acctual_end_datetime"
        case timezone = "timezone"
        case location = "location"
        case latitude = "latitude"
        case longitude = "longitude"
        case link_of_event = "link_of_event"
        case description = "description"
        case event_categories = "event_categories"
        case fee = "fee"
        case fee_currency = "fee_currency"
        case max_attendees = "max_attendees"
        case language = "language"
        case accept_participants = "accept_participants"
        case allow_comments = "allow_comments"
        case status = "status"
        case created_on = "created_on"
        case updated_on = "updated_on"
        case use_name = "use_name"
        case use_display_name = "use_display_name"
        case total_comment = "total_comment"
        case total_save = "total_save"
        case total_share = "total_share"
        case user_share_status = "user_share_status"
        case user_save_status = "user_save_status"
        case symbol = "symbol"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        user_id = try values.decodeIfPresent(String.self, forKey: .user_id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        file = try values.decodeIfPresent(String.self, forKey: .file)
        multiple = try values.decodeIfPresent(String.self, forKey: .multiple)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        start_time = try values.decodeIfPresent(String.self, forKey: .start_time)
        start_date = try values.decodeIfPresent(String.self, forKey: .start_date)
        end_time = try values.decodeIfPresent(String.self, forKey: .end_time)
        end_date = try values.decodeIfPresent(String.self, forKey: .end_date)
        acctual_start_datetime = try values.decodeIfPresent(String.self, forKey: .acctual_start_datetime)
        acctual_end_datetime = try values.decodeIfPresent(String.self, forKey: .acctual_end_datetime)
        timezone = try values.decodeIfPresent(String.self, forKey: .timezone)
        location = try values.decodeIfPresent(String.self, forKey: .location)
        latitude = try values.decodeIfPresent(String.self, forKey: .latitude)
        longitude = try values.decodeIfPresent(String.self, forKey: .longitude)
        link_of_event = try values.decodeIfPresent(String.self, forKey: .link_of_event)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        event_categories = try values.decodeIfPresent(String.self, forKey: .event_categories)
        fee = try values.decodeIfPresent(String.self, forKey: .fee)
        fee_currency = try values.decodeIfPresent(String.self, forKey: .fee_currency)
        max_attendees = try values.decodeIfPresent(String.self, forKey: .max_attendees)
        language = try values.decodeIfPresent(String.self, forKey: .language)
        accept_participants = try values.decodeIfPresent(String.self, forKey: .accept_participants)
        allow_comments = try values.decodeIfPresent(String.self, forKey: .allow_comments)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        created_on = try values.decodeIfPresent(String.self, forKey: .created_on)
        updated_on = try values.decodeIfPresent(String.self, forKey: .updated_on)
        use_name = try values.decodeIfPresent(String.self, forKey: .use_name)
        use_display_name = try values.decodeIfPresent(String.self, forKey: .use_display_name)
        total_comment = try values.decodeIfPresent(String.self, forKey: .total_comment)
        total_save = try values.decodeIfPresent(String.self, forKey: .total_save)
        total_share = try values.decodeIfPresent(String.self, forKey: .total_share)
        user_share_status = try values.decodeIfPresent(Int.self, forKey: .user_share_status)
        user_save_status = try values.decodeIfPresent(Int.self, forKey: .user_save_status)
        symbol = try values.decodeIfPresent(String.self, forKey: .symbol)
        
        }

    }
}
