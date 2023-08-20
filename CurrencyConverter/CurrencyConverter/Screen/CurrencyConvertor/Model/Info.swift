//
//  Info.swift
//  CurrencyConverter
//
//  Created by abdul karim on 20/08/23.
//

import Foundation
struct Info : Codable {
	let timestamp : Int?
	let rate : Double?

	enum CodingKeys: String, CodingKey {

		case timestamp = "timestamp"
		case rate = "rate"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		timestamp = try values.decodeIfPresent(Int.self, forKey: .timestamp)
		rate = try values.decodeIfPresent(Double.self, forKey: .rate)
	}

}
