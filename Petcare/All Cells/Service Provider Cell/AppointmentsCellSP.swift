//
//  AppointmentsCellSP.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 29/12/20.
//

import UIKit

class AppointmentsCellSP: UITableViewCell {

    @IBOutlet weak var regID: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var service: UILabel!
    @IBOutlet weak var dateandtime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let margins = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        contentView.frame = contentView.frame.inset(by: margins)
        //contentView.backgroundColor = .white
        //contentView.layer.shadowOffset = CGSize(width: 0, height: 1)
        //contentView.layer.shadowColor = UIColor.lightGray.cgColor
        //contentView.layer.shadowOpacity = 0.5
        //contentView.layer.shadowRadius = 8
        contentView.layer.masksToBounds = false
        contentView.layer.cornerRadius = 20
    }
}
