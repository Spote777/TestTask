//
//  ModalData.swift
//  TestTask
//
//  Created by Павел Заруцков on 17.10.2021.
//

import Foundation

struct ResponseToken: Decodable {
    let response: TokenData
}

struct TokenData: Decodable {
    let token: String
}

struct ResponseData: Decodable {
    var response : [ModalData]
}

//struct ModalData: Decodable {
//    let desc: String?
//    let amount: Double?
//    let currency: String?
//    let created:  Int?
//}

class ModalData:Decodable {
    
    var amount : Amount?
    var created : Int?
    var currency : String?
    var desc : String?
    

    enum Amount: Decodable {
        case double(Double)
        case string(String)

        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let x = try? container.decode(Double.self) {
                self = .double(x)
                return
            }
            if let x = try? container.decode(String.self) {
                self = .string(x)
                return
            }
            throw DecodingError.typeMismatch(Amount.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Amount"))
        }

        func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .double(let x):
                try container.encode(x)
            case .string(let x):
                try container.encode(x)
            }
        }
    }
}
