//
//  File.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 29/12/20.
//

import Foundation
import UIKit

class EventsCellSP: UITableViewCell {

    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var seeMoreButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.seeMoreButton.addViewBorder(borderColor: UIColor.red.cgColor, borderWith: 1.0, borderCornerRadius: 0)
        self.seeMoreButton.layer.cornerRadius = self.seeMoreButton.layer.frame.height/2
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let margins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        contentView.frame = contentView.frame.inset(by: margins)
    }
}
