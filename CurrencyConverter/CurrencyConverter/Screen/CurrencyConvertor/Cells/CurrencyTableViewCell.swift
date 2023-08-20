//
//  CurrencyTableViewCell.swift
//  CurrencyConverter
//
//  Created by abdul karim on 20/08/23.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {

    @IBOutlet weak var lCurrencyPrice: UILabel!
    @IBOutlet weak var lCurrencyCode: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension CurrencyTableViewCell : ViewFromNib {}
