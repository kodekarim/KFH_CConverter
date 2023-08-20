//
//  Coordinator.swift
//  CurrencyConverter
//
//  Created by abdul karim on 20/08/23.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinator : [Coordinator] { get }
    var navigationController : UINavigationController { get }
    
    func startCoordinator()
}

class MainCoordinator : Coordinator {
    var childCoordinator: [Coordinator] = []
    var navigationController = UINavigationController()
    
    func startCoordinator() {
        let initialViewController = HomeViewController()
        initialViewController.mainCoordinator = self
        initialViewController.viewModel = HomeViewModel()
        initialViewController.navigationItem.title = "Tools"
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.pushViewController(initialViewController, animated: false)
    }
    
    func showValidator(apiServiceObj:APIService) {
        let validationViewController = ValidationViewController()
        validationViewController.viewModel = ValidationViewModel(apiService: apiServiceObj)
        navigationController.pushViewController(validationViewController, animated: true)
    }
    
    func showConverter(coordinatorObj:MainCoordinator?, apiServiceObj:APIService?) {
        let converterViewController = ConverterViewController()
        converterViewController.viewModel = ConverterViewModel(coordinator: coordinatorObj, apiService: apiServiceObj)
        navigationController.pushViewController(converterViewController, animated: true)
    }
    
    func openCurrencyPicker() {
        if let topViewController = navigationController.viewControllers.last {
            let pickerController = CurrencyPickerView()
            pickerController.viewModel = CurrencyPickerViewModel()
            pickerController.delegate = topViewController as? any CurrencyPickerViewDelegate
            if let sheet = pickerController.sheetPresentationController {
                sheet.detents = [ .medium()]
                sheet.prefersGrabberVisible = true
            }
            navigationController.present(pickerController, animated: true)
        }

    }
}
