//
//  ViewFromNIb.swift
//  CurrencyConverter
//
//  Created by abdul karim on 20/08/23.
//

import Foundation
import UIKit

protocol ViewFromNib {}

extension ViewFromNib {
    
    static var nibName:String {
        return String(describing: Self.self)
    }
    
    static var nib:UINib {
        return UINib(nibName: self.nibName, bundle: nil)
    }
    
    static func registerTableviewCellOn(_ tableview:UITableView) {
        tableview.register(nib, forCellReuseIdentifier: nibName)
    }
    
    static func viewController<T: UIViewController>() -> T? {
        return T(nibName: nibName, bundle: nil)
    }
}
