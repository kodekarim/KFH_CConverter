//
//  ValidationViewModel.swift
//  CurrencyConverter
//
//  Created by abdul karim on 20/08/23.
//

import Foundation

protocol ValidationViewModelDelegate : AnyObject {
    func showloading()
    func showSuccess()
    func handleError(error:Error)
}

class ValidationViewModel {
    
    weak var delegate:ValidationViewModelDelegate?
    var ibanResponseData:ValidationModel?
    var apiService: APIService!
    
    init(apiService:APIService) {
        self.apiService = apiService
    }

    
    func isIBANValidCount(_ iban: String) -> Bool {
        let formattedIBAN = iban.replacingOccurrences(of: " ", with: "").uppercased()
        if formattedIBAN.count <= 20 {
            return false
        }
        return true
    }
    
    func callIbanValidationAPI(number:String){
        delegate?.showloading()
        let queryParams = ["iban_number" : number]
        apiService.getIbanValidation(parms: queryParams, successCallback: { [weak self] (response) in
            if let _StrongSelf = self, let responseObj = response {
                
                guard let jsonData = try? JSONSerialization.data(withJSONObject: responseObj, options: []) else {
                    fatalError("Failed to convert dictionary to Data")
                }

                do {
                    let validationModel = try JSONDecoder().decode(ValidationModel.self, from: jsonData)
                    _StrongSelf.ibanResponseData = validationModel
                } catch {
                    self?.delegate?.handleError(error: APIError.parseError)
                }
                
                _StrongSelf.delegate?.showSuccess()
            }
        }, errorCallback: { [weak self] (error) in
            self?.delegate?.handleError(error: APIError.noInternetAvailable)
        }, networkErrorCallback: {
            self.delegate?.handleError(error: APIError.noInternetAvailable)
        })
    }
}
