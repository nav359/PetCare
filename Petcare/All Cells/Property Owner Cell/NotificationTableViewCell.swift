//
//  NotificationTableViewCell.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 19/12/20.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var grayView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var newLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.grayView.layer.cornerRadius = self.grayView.layer.frame.width/2
        backView.backgroundColor = .clear
        self.selectionStyle = .none
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let margins = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        contentView.frame = contentView.frame.inset(by: margins)
        contentView.backgroundColor = .white
        contentView.layer.shadowOffset = CGSize(width: 0, height: 1)
        contentView.layer.shadowColor = UIColor.lightGray.cgColor
        contentView.layer.shadowOpacity = 0.5
        contentView.layer.shadowRadius = 8
        contentView.layer.masksToBounds = false
        contentView.layer.cornerRadius = 5
    }
}
