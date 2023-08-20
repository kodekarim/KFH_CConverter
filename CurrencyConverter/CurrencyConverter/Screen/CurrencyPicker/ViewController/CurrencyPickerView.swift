//
//  CurrencyPickerView.swift
//  CurrencyConverter
//
//  Created by abdul karim on 20/08/23.
//

import UIKit
protocol CurrencyPickerViewDelegate:AnyObject {
    func selectedCurrenct(model:CurrencyModel)
}

class CurrencyPickerView: UIViewController {

    @IBOutlet weak var bSelectButton: UIButton!
    @IBOutlet weak var pvCurrency: UIPickerView! {
        didSet {
            pvCurrency.delegate = self
            pvCurrency.dataSource = self
        }
    }
    
    weak var delegate: CurrencyPickerViewDelegate?
    
    var viewModel:CurrencyPickerViewModel!
    var selectedCurrency:CurrencyModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadData()
        addTarget()
    }
    
    func addTarget() {
        bSelectButton.addTarget(self, action: #selector(handleSelectButton), for: .touchUpInside)
    }
    
    @objc func handleSelectButton() {
        if let selectedCurrency = selectedCurrency {
            delegate?.selectedCurrenct(model: selectedCurrency)
            self.dismiss(animated: true)
        }
    }
}

extension CurrencyPickerView : UIPickerViewDataSource, UIPickerViewDelegate {
    // MARK: - UIPickerViewDataSource
     func numberOfComponents(in pickerView: UIPickerView) -> Int {
         return 1
     }

     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         return viewModel.currency.count
     }

     // MARK: - UIPickerViewDelegate
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         return "\(viewModel.currency[row].name) - \(viewModel.currency[row].code)"
     }

     func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
         print("Selected: \(viewModel.currency[row].name)")
         selectedCurrency = viewModel.currency[row]
     }
}
