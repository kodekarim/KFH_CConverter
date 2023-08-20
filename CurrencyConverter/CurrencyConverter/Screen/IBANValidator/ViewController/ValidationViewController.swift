//
//  IBANViewController.swift
//  CurrencyConverter
//
//  Created by abdul karim on 20/08/23.
//

import UIKit

class ValidationViewController: UIViewController {
    
    @IBOutlet weak var lVerifiedLabel  :UILabel!
    @IBOutlet weak var lBankCodeLabel  :UILabel!
    @IBOutlet weak var lBankNameLabel  :UILabel!
    @IBOutlet weak var lBankZipLabel   :UILabel!
    @IBOutlet weak var lBankCityLabel  :UILabel!
    @IBOutlet weak var lBankBicLabel   :UILabel!
    
    @IBOutlet weak var tfIbanTextFiled  :UITextField!
    @IBOutlet weak var bValidateButton  :UIButton!
    
    var viewModel:ValidationViewModel! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTarget()
        clearData()
    }
    
    fileprivate func addTarget() {
        bValidateButton.addTarget(self, action: #selector(handleValidationButton), for: .touchUpInside)
    }
    
    @objc func handleValidationButton() {
        clearData()
        let ibanNumber = tfIbanTextFiled.text ?? ""
        if viewModel.isIBANValidCount(ibanNumber) {
            viewModel.callIbanValidationAPI(number: ibanNumber)
        }else {
            UIAlertController.alert(title:"Alert", msg:"Iban not valid", target: self)
        }
    }


}
extension ValidationViewController : ValidationViewModelDelegate {
    func showloading() {
        bValidateButton.isEnabled = false
        bValidateButton.setTitle("loading..", for: .normal)
    }
    
    func showSuccess() {
        bValidateButton.isEnabled = true
        bValidateButton.setTitle("Validate", for: .normal)
        
        lVerifiedLabel.text = viewModel.ibanResponseData?.valid ?? false ? "Yes" : "No"
        lBankCodeLabel.text = viewModel.ibanResponseData?.bank_data?.bank_code ?? ""
        lBankNameLabel.text  = viewModel.ibanResponseData?.bank_data?.name ?? ""
        lBankZipLabel.text = viewModel.ibanResponseData?.bank_data?.zip ?? ""
        lBankCityLabel.text = viewModel.ibanResponseData?.bank_data?.city ?? ""
        lBankBicLabel.text = viewModel.ibanResponseData?.bank_data?.bic ?? ""
    }
    
    func handleError(error: Error) {
        UIAlertController.alert(title:"Alert", msg: error.localizedDescription, target: self)
        clearData()
    }
    
    func clearData() {
        let labelArr = [lVerifiedLabel,lBankCodeLabel,lBankNameLabel, lBankZipLabel, lBankCityLabel, lBankBicLabel ]
        
        for label in labelArr {
            label?.text = "None"
        }
        bValidateButton.isEnabled = true
    }
    
    
}
