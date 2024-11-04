//
//  SettingsTableViewCell.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 19/12/20.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        // Initialization code
    }
}
