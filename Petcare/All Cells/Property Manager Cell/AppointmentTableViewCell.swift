//
//  AppointmentTableViewCell.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 17/12/20.
//

import UIKit

class AppointmentTableViewCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var custImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
