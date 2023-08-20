//
//  CurrencyModel.swift
//  CurrencyConverter
//
//  Created by abdul karim on 20/08/23.
//

import Foundation

import Foundation

//struct CurrencyModel : Codable {
//    let success : Bool?
//    let symbols : Symbols?
//
//    enum CodingKeys: String, CodingKey {
//
//        case success = "success"
//        case symbols = "symbols"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        success = try values.decodeIfPresent(Bool.self, forKey: .success)
//        symbols = try values.decodeIfPresent(Symbols.self, forKey: .symbols)
//    }
//
//}


struct CurrencyModel {
    let code: String
    let name: String
}
