//
//  Query.swift
//  CurrencyConverter
//
//  Created by abdul karim on 20/08/23.
//

import Foundation
struct Query : Codable {
	let from : String?
	let to : String?
	let amount : Int?

	enum CodingKeys: String, CodingKey {

		case from = "from"
		case to = "to"
		case amount = "amount"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		from = try values.decodeIfPresent(String.self, forKey: .from)
		to = try values.decodeIfPresent(String.self, forKey: .to)
		amount = try values.decodeIfPresent(Int.self, forKey: .amount)
	}

}
