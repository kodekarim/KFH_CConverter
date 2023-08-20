//
//  ConverterViewController.swift
//  CurrencyConverter
//
//  Created by abdul karim on 20/08/23.
//

import UIKit

class ConverterViewController: UIViewController {

    @IBOutlet weak var bSelectCurrency1: UIButton!
    @IBOutlet weak var tfCurrencyField1: UITextField!
    
    @IBOutlet weak var bSelectCurrency2: UIButton!
    @IBOutlet weak var tfResultTextField: UITextField!
    
    @IBOutlet weak var bConvertButton: UIButton!
    
    var viewModel:ConverterViewModel! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addTargets()
    }
    
    fileprivate func addTargets() {
        bSelectCurrency1.addTarget(self, action: #selector(handleSelectCurrency1), for: .touchUpInside)
        bSelectCurrency2.addTarget(self, action: #selector(handleSelectcurrency2 ), for: .touchUpInside)
        bConvertButton.addTarget(self, action: #selector(handleConvertcurrency), for: .touchUpInside)
    }
    
    @objc func handleSelectCurrency1() {
        viewModel.currency1Selcted = true
        viewModel.mainCoordinator?.openCurrencyPicker()
    }
    
    @objc func handleSelectcurrency2() {
        viewModel.currency1Selcted = false
        viewModel.mainCoordinator?.openCurrencyPicker()
    }
    
    @objc func handleConvertcurrency() {
        if bSelectCurrency1.titleLabel?.text == "Select Currency" || bSelectCurrency2.titleLabel?.text == "Select Currency" || tfCurrencyField1.text == "" {
            UIAlertController.alert(title:"Alert", msg:"fields are empty", target: self)
        } else {
            let amount = tfCurrencyField1.text ?? ""
            let from = bSelectCurrency1.titleLabel?.text ?? ""
            let to = bSelectCurrency2.titleLabel?.text ?? ""
            
            viewModel.convertCurrency(amount: Int(amount) ?? 0, from: from, to: to)
        }
    }
}

extension ConverterViewController :ConverterViewModelDelegate {
    func showloading() {
        bConvertButton.isEnabled = false
        bConvertButton.setTitle("loading", for: .normal)
        tfResultTextField.text  = ""
    }
    
    func showSuccess() {
        bConvertButton.isEnabled = true
        bConvertButton.setTitle("Convert", for: .normal)
        
        tfResultTextField.text = "\(viewModel.convertedResult?.info?.rate ?? 0.0)"
    }
    
    func handleError(error: Error) {
        tfResultTextField.text  = ""
        UIAlertController.alert(title:"Alert", msg:error.localizedDescription, target: self)
    }
    
    
}

extension ConverterViewController : CurrencyPickerViewDelegate {
    func selectedCurrenct(model: CurrencyModel) {
        if viewModel.currency1Selcted {
            bSelectCurrency1.setTitle(model.code, for: .normal)
        }else {
            bSelectCurrency2.setTitle(model.code, for: .normal)
        }
    }
}
