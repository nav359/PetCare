//
//  ClientListTableViewCell.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 15/12/20.
//

import UIKit

class ClientListTableViewCell: UITableViewCell {

    @IBOutlet var backView: UIView!
    @IBOutlet var clientImage: UIImageView!
    @IBOutlet weak var clientname: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.selectionStyle = .none
        let margins = UIEdgeInsets(top: 10, left: 30, bottom: 10, right: 30)
        contentView.frame = contentView.frame.inset(by: margins)
        contentView.backgroundColor = .white
        contentView.layer.shadowOffset = CGSize(width: 0, height: 1)
        contentView.layer.shadowColor = UIColor.lightGray.cgColor
        contentView.layer.shadowOpacity = 0.5
        contentView.layer.shadowRadius = 8
        contentView.layer.masksToBounds = false
        contentView.layer.cornerRadius = 10
    }
}
