//
//  Iban_data.swift
//  CurrencyConverter
//
//  Created by abdul karim on 20/08/23.
//

import Foundation
struct IbanData : Codable {
	let country : String?
	let country_code : String?
	let sepa_country : Bool?
	let checksum : String?
	let bBAN : String?
	let bank_code : String?
	let account_number : String?
	let branch : String?
	let national_checksum : String?
	let country_iban_format_as_swift : String?
	let country_iban_format_as_regex : String?

	enum CodingKeys: String, CodingKey {

		case country = "country"
		case country_code = "country_code"
		case sepa_country = "sepa_country"
		case checksum = "checksum"
		case bBAN = "BBAN"
		case bank_code = "bank_code"
		case account_number = "account_number"
		case branch = "branch"
		case national_checksum = "national_checksum"
		case country_iban_format_as_swift = "country_iban_format_as_swift"
		case country_iban_format_as_regex = "country_iban_format_as_regex"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		country = try values.decodeIfPresent(String.self, forKey: .country)
		country_code = try values.decodeIfPresent(String.self, forKey: .country_code)
		sepa_country = try values.decodeIfPresent(Bool.self, forKey: .sepa_country)
		checksum = try values.decodeIfPresent(String.self, forKey: .checksum)
		bBAN = try values.decodeIfPresent(String.self, forKey: .bBAN)
		bank_code = try values.decodeIfPresent(String.self, forKey: .bank_code)
		account_number = try values.decodeIfPresent(String.self, forKey: .account_number)
		branch = try values.decodeIfPresent(String.self, forKey: .branch)
		national_checksum = try values.decodeIfPresent(String.self, forKey: .national_checksum)
		country_iban_format_as_swift = try values.decodeIfPresent(String.self, forKey: .country_iban_format_as_swift)
		country_iban_format_as_regex = try values.decodeIfPresent(String.self, forKey: .country_iban_format_as_regex)
	}

}
