//
//  ValidationUnitTest.swift
//  CurrencyConverterTests
//
//  Created by abdul karim on 20/08/23.
//

import XCTest
@testable import CurrencyConverter

final class ValidationUnitTest: XCTestCase {
    
    var viewModel: ValidationViewModel!
    var apiServiceMock: APIServiceMock!
    
    override func setUpWithError() throws {
        apiServiceMock = APIServiceMock()
        viewModel = ValidationViewModel(apiService: apiServiceMock)
        
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
        apiServiceMock = nil
    }
    
    func testValidIBANCount() {
        let validIBAN = "DE89370400440532013000"
        XCTAssertTrue(viewModel.isIBANValidCount(validIBAN))
    }
    
    func testInvalidIBANCount() {
        let shortIBAN = "GB82WEST12345698765432"
        XCTAssertTrue(viewModel.isIBANValidCount(shortIBAN))
        
        let longIBAN = "DE893704004405320130001234567890"
        XCTAssertTrue(viewModel.isIBANValidCount(longIBAN))
    }
    
    func testCallIbanValidationAPIWithNotValidResponseee() {
        apiServiceMock.stubGetIbanValidationResponse(response: convertStringToDict(str: apiServiceMock.mockJSONStr), error: nil)
        
        viewModel.callIbanValidationAPI(number: "DE89370400440532013000")
        XCTAssertNil(viewModel.ibanResponseData)
    }
    
    
    func convertStringToDict(str:String) -> [String:Any]? {
        if let jsonData = str.data(using: .utf8) {
            do {
                let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
                
                if let jsonDictionary = jsonObject as? [String: Any] {
                    return jsonDictionary
                }
            } catch {
                debugPrint("Error parsing JSON: \(error)")
            }
        } else {
            print("Failed to convert string to data")
        }
        return nil
    }
    
    
}

