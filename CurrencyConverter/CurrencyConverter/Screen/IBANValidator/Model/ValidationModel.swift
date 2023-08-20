//
//  ValidationModel.swift
//  CurrencyConverter
//
//  Created by abdul karim on 20/08/23.
//

import Foundation
struct ValidationModel : Codable {
	let valid : Bool?
	let iban : String?
	let iban_data : IbanData?
	let bank_data : BankData?
	let country_iban_example : String?

	enum CodingKeys: String, CodingKey {

		case valid = "valid"
		case iban = "iban"
		case iban_data = "iban_data"
		case bank_data = "bank_data"
		case country_iban_example = "country_iban_example"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		valid = try values.decodeIfPresent(Bool.self, forKey: .valid)
		iban = try values.decodeIfPresent(String.self, forKey: .iban)
		iban_data = try values.decodeIfPresent(IbanData.self, forKey: .iban_data)
		bank_data = try values.decodeIfPresent(BankData.self, forKey: .bank_data)
		country_iban_example = try values.decodeIfPresent(String.self, forKey: .country_iban_example)
	}

}
