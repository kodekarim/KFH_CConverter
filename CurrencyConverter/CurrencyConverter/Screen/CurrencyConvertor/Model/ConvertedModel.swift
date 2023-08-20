//
//  ConvertedModel.swift
//  CurrencyConverter
//
//  Created by abdul karim on 20/08/23.
//

import Foundation
struct ConvertedModel : Codable {
	let success : Bool?
	let query : Query?
	let info : Info?
	let date : String?
	let result : Double?

	enum CodingKeys: String, CodingKey {

		case success = "success"
		case query = "query"
		case info = "info"
		case date = "date"
		case result = "result"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		success = try values.decodeIfPresent(Bool.self, forKey: .success)
		query = try values.decodeIfPresent(Query.self, forKey: .query)
		info = try values.decodeIfPresent(Info.self, forKey: .info)
		date = try values.decodeIfPresent(String.self, forKey: .date)
		result = try values.decodeIfPresent(Double.self, forKey: .result)
	}

}
