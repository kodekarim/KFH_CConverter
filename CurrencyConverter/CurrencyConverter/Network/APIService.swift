//
//  APIService.swift
//  CurrencyConverter
//
//  Created by abdul karim on 20/08/23.
//

import Foundation

class APIService {
    // Replace this with your actual API endpoint URL

    func getIbanValidation(parms: QueryParams, successCallback: @escaping ((_ response: JSON?) -> Void), errorCallback: @escaping ((_ error: Error) -> Void), networkErrorCallback: @escaping (() -> Void)) {
        NetworkAdapter.request(BaseRouter.baseRouterManager(APIRouter.ibanValidation(parms)), completionHandler: { (response) in
            if let responseJSON = response as? JSON {
                successCallback(responseJSON)
            }
            else {
                errorCallback(APIError.parseError)
            }
        }, errorHandler: { (error) in
            errorCallback(error)
        }) {
            networkErrorCallback()
        }
    }
    
    func convertCurrency(parms: QueryParams, successCallback: @escaping ((_ response: JSON?) -> Void), errorCallback: @escaping ((_ error: Error) -> Void), networkErrorCallback: @escaping (() -> Void)) {
        NetworkAdapter.request(BaseRouter.baseRouterManager(APIRouter.currencyConverter(parms)), completionHandler: { (response) in
            if let responseJSON = response as? JSON {
                successCallback(responseJSON)
            }
            else {
                errorCallback(APIError.parseError)
            }
        }, errorHandler: { (error) in
            errorCallback(error)
        }) {
            networkErrorCallback()
        }
    }
    
}
