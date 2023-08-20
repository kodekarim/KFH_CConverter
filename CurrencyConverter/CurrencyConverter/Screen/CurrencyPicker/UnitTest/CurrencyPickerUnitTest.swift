//
//  CurrencyPickerUnitTest.swift
//  CurrencyConverterTests
//
//  Created by abdul karim on 21/08/23.
//

import XCTest
@testable import CurrencyConverter

final class CurrencyPickerUnitTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoadData() {
         guard let path = Bundle.main.path(forResource: "Currency", ofType: "json") else {
             XCTFail("JSON file not found")
             return
         }
         
         let data = try! Data(contentsOf: URL(fileURLWithPath: path))

         let mockBundle = MockBundle(jsonData: data)
         let viewModel = CurrencyPickerViewModel()
         viewModel.loadData()
         
        XCTAssertNotNil(viewModel.currency)
        XCTAssertGreaterThan(viewModel.currency.count, 1)
     }
    
    func testDataToJSON() {
        let jsonData = "{\"key\": \"value\"}".data(using: .utf8)!
        let viewModel = CurrencyPickerViewModel()
        let jsonObject = viewModel.dataToJSON(data: jsonData) as? [String: String]
        
        XCTAssertNotNil(jsonObject)
        XCTAssertEqual(jsonObject?["key"], "value")
    }


}
