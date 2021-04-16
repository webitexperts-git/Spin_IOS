//
//  EventDetailModel.swift
//  Spine
//
//  Created by Aashita Tyagi on 06/04/21.
//

import Foundation


struct EventDetailModel : Codable {
    let status : Bool?
    let data : Data?
    let image : String?
    let message : String?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case data = "data"
        case image = "image"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        data = try values.decodeIfPresent(Data.self, forKey: .data)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }
    
    struct Data : Codable, Hashable {
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
        let booking_status : String?
        let booking_id : String?
        let user_display_name : String?
        let use_name : String?
        let profile_pic : String?
        let symbol: String?

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
            case booking_status = "booking_status"
            case booking_id = "booking_id"
            case user_display_name = "user_display_name"
            case use_name = "use_name"
            case profile_pic = "profile_pic"
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
            booking_status = try values.decodeIfPresent(String.self, forKey: .booking_status)
            booking_id = try values.decodeIfPresent(String.self, forKey: .booking_id)
            user_display_name = try values.decodeIfPresent(String.self, forKey: .user_display_name)
            use_name = try values.decodeIfPresent(String.self, forKey: .use_name)
            profile_pic = try values.decodeIfPresent(String.self, forKey: .profile_pic)
            symbol = try values.decodeIfPresent(String.self, forKey: .symbol)
        }

    }


}
