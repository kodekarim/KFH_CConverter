//
//  APIServiceMock.swift
//  CurrencyConverter
//
//  Created by abdul karim on 20/08/23.
//

import Foundation

class APIServiceMock: APIService {
    let mockJSONStr =
    """
    {
        "valid": true,
        "iban": "DE89370400440532013000",
        "iban_data": {
            "country": "Germany",
            "country_code": "DE",
            "sepa_country": true,
            "checksum": "89",
            "BBAN": "370400440532013000",
            "bank_code": "37040044",
            "account_number": "0532013000",
            "branch": "",
            "national_checksum": "",
            "country_iban_format_as_swift": "DE2!n8!n10!n",
            "country_iban_format_as_regex": "^DE(\\d{2})(\\d{8})(\\d{10})$"
        },
        "bank_data": {
            "bank_code": "37040044",
            "name": "Commerzbank",
            "zip": "50447",
            "city": "Köln",
            "bic": "COBADEFFXXX"
        },
        "country_iban_example": "DE89370400440532013000"
    }
    """
    
    var stubbedGetIbanValidationResponse: (response: [String: Any]?, error: Error?)?
    
    func stubGetIbanValidationResponse(response: [String: Any]?, error: Error?) {
        stubbedGetIbanValidationResponse = (response, error)
    }
}
