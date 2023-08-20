//
//  HomeViewModel.swift
//  CurrencyConverter
//
//  Created by abdul karim on 20/08/23.
//

import Foundation

class HomeViewModel {
    
    var tools:[HomeModel] = [HomeModel]()
    //state property
    enum HomeListState {
        case loading
        case success
        case error(Error)
    }
    var stateDidChange: ((HomeListState) -> Void)?
    
    var state: HomeListState = .loading {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.stateDidChange?(self?.state ?? .loading)
            }
        }
    }
    
    var apiService = APIService()
    
    init() {
        setupData()
    }
    
    func setupData() {
        state = .loading
        let page1 = HomeModel(title: IBAN_VALIDATOR)
        let page2 = HomeModel(title: CURRENCY_CONVERTER)
        
        tools = [page1, page2]
        state = .success
    }
    
    func numberOfRows() -> Int {
        return tools.count
    }
    
    func toolAtIndex(_ index:Int) -> HomeModel {
        return tools[index]
    }
    
}
