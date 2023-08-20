//
//  CurrencyPickerViewModel.swift
//  CurrencyConverter
//
//  Created by abdul karim on 20/08/23.
//

import Foundation

class CurrencyPickerViewModel {
    
    var currency = [CurrencyModel]()
    
    init() {}
    
    func loadData() {
        guard let path = Bundle.main.path(forResource: "Currency", ofType: "json") else {
            return
        }
        do {
            let data = try Data(contentsOf: URL(filePath: path))
            if let json = dataToJSON(data: data) as? [String: Any] {
                let symbols = json["symbols"] as? [String:String]
                for (code, name) in symbols! {
                   let obj = CurrencyModel(code: code, name: name)
                    currency.append(obj)
                }
            }

        } catch {
            print(error)
        }
    }
    
    func dataToJSON(data: Data) -> Any? {
       do {
           return try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
       } catch let myJSONError {
           print(myJSONError)
       }
       return nil
    }

}
