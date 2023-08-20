//
//  MockCurrencyData.swift
//  CurrencyConverter
//
//  Created by abdul karim on 21/08/23.
//

import Foundation

class MockBundle: Bundle {
    private let jsonData: Data
    
    init(jsonData: Data) {
        self.jsonData = jsonData
        super.init()
    }
    
    override func path(forResource name: String?, ofType ext: String?) -> String? {
        return "/fake/path"
    }
    
    override func url(forResource name: String?, withExtension ext: String?) -> URL? {
        return URL(fileURLWithPath: "/fake/path")
    }
    
    override func object(forInfoDictionaryKey key: String) -> Any? {
        return jsonData
    }
}





