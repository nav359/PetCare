//
//  File.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 29/12/20.
//

import Foundation
import UIKit

class ClientListTableViewCellSP: UITableViewCell {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var clientImage: UIImageView!
    @IBOutlet weak var clientname: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
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
        contentView.layer.cornerRadius = 20
    }

}
