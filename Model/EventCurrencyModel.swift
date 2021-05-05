//
//  EventCurrencyModel.swift
//  Spine
//
//  Created by Aashita Tyagi on 19/04/21.
//

import Foundation
struct EventCurrencyModel : Codable {
    let status : Bool?
    let data : [Data]?
    let message : String?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case data = "data"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        data = try values.decodeIfPresent([Data].self, forKey: .data)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }
    
    struct Data : Codable, Hashable{
        let id : String?
        let country : String?
        let currency : String?
        let code : String?
        let symbol : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case country = "country"
            case currency = "currency"
            case code = "code"
            case symbol = "symbol"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            country = try values.decodeIfPresent(String.self, forKey: .country)
            currency = try values.decodeIfPresent(String.self, forKey: .currency)
            code = try values.decodeIfPresent(String.self, forKey: .code)
            symbol = try values.decodeIfPresent(String.self, forKey: .symbol)
        }

    }


}
