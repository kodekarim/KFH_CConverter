//
//  ConverterViewModel.swift
//  CurrencyConverter
//
//  Created by abdul karim on 20/08/23.
//

import Foundation

protocol ConverterViewModelDelegate : AnyObject {
    func showloading()
    func showSuccess()
    func handleError(error:Error)
}


class ConverterViewModel {
    
    var mainCoordinator:MainCoordinator?
    var apiService: APIService?
    var currency1Selcted:Bool = true
    var convertedResult:ConvertedModel?
    
    weak var delegate:ConverterViewModelDelegate?
    
    init(coordinator:MainCoordinator?, apiService:APIService?) {
        self.mainCoordinator = coordinator
        self.apiService = apiService
    }
    
    func convertCurrency(amount:Int, from:String, to:String) {
        delegate?.showloading()
        let queryParams = ["to" : to,
                           "from" : from,
                           "amount" : amount
        ] as [String : Any]
        apiService?.convertCurrency(parms: queryParams, successCallback: { [weak self] (response) in
            if let _StrongSelf = self, let responseObj = response {
                
                guard let jsonData = try? JSONSerialization.data(withJSONObject: responseObj, options: []) else {
                    fatalError("Failed to convert dictionary to Data")
                }

                do {
                    let convertedModel = try JSONDecoder().decode(ConvertedModel.self, from: jsonData)
                    _StrongSelf.convertedResult = convertedModel
                    _StrongSelf.delegate?.showSuccess()
                } catch {
                    self?.delegate?.handleError(error: APIError.parseError)
                }
                

            }
        }, errorCallback: { [weak self] (error) in
            self?.delegate?.handleError(error: APIError.noInternetAvailable)
        }, networkErrorCallback: {
            self.delegate?.handleError(error: APIError.noInternetAvailable)
        })
    }
}
