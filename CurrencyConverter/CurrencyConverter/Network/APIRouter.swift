//
//  APIRouter.swift
//  CurrencyConverter
//
//  Created by abdul karim on 20/08/23.
//

import Foundation
import Alamofire

enum APIRouter: BaseRouterProtocol {
    
    case ibanValidation(QueryParams)
    case currencyConverter(QueryParams)
    
    var path: String {
        switch self {
        case .ibanValidation:
            return APIConstants.ibanValidation
        case .currencyConverter:
            return APIConstants.convertCurrency
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .ibanValidation:
            return .get
        case .currencyConverter:
            return .get
            
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .ibanValidation(let params):
            return params
        case .currencyConverter(let params):
            return params

        }
    }
    
    var body: AnyObject? {
        switch self {
        default:
            return nil
            
        }
    }
    
    var headers: [String : String]? {
        switch self {
            
        default:
            return nil
        }
    }
    
}

