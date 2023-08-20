//
//  HomeViewController.swift
//  CurrencyConverter
//
//  Created by abdul karim on 20/08/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tvTableView: UITableView! {
        didSet {
            tvTableView.delegate = self
            tvTableView.dataSource = self
            tvTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        }
    }
    
    weak var mainCoordinator:MainCoordinator?
    var viewModel:HomeViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        handleViewState()
    }
    
    fileprivate func handleViewState() {
        viewModel.stateDidChange = { [weak self] state in
            switch state {
            case .loading:
                debugPrint("Loading..")
            case .success:
                self?.tvTableView.reloadData()
            case .error(let error):
                debugPrint("Handle error - \(error.localizedDescription)")
            }
        }
    }
}

extension HomeViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let toolcell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            let toolListObj = viewModel.toolAtIndex(indexPath.row)
            toolcell.textLabel?.text = toolListObj.title
            return toolcell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toolListObj = viewModel.toolAtIndex(indexPath.row)
        switch toolListObj.title {
        case IBAN_VALIDATOR:
            mainCoordinator?.showValidator(apiServiceObj: viewModel.apiService)
        case CURRENCY_CONVERTER:
            mainCoordinator?.showConverter(coordinatorObj: mainCoordinator, apiServiceObj: viewModel.apiService)
        default:
            break
        }
    }
    
    
}
