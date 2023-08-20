//
//  HomeUnitTest.swift
//  CurrencyConverterTests
//
//  Created by abdul karim on 20/08/23.
//

import XCTest
@testable import CurrencyConverter

final class HomeUnitTest: XCTestCase {
    
    var viewModel: HomeViewModel!
    
    override func setUpWithError() throws {
        viewModel = HomeViewModel()
        viewModel.setupData()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testNumberOfRows() {
         let numberOfRows = viewModel.numberOfRows()
         XCTAssertEqual(numberOfRows, 2) // Expected number of rows based on the setupData method
     }

     func testToolAtIndex() {
         let tool1 = viewModel.toolAtIndex(0)
         XCTAssertEqual(tool1.title, "IBAN Validator") // Expected title for the first tool

         let tool2 = viewModel.toolAtIndex(1)
         XCTAssertEqual(tool2.title, "Currency Converter") // Expected title for the second tool
     }

}
