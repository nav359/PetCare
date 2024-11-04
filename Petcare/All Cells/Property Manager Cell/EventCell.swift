//
//  EventCell.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 18/12/20.
//

import Foundation
import UIKit

class EventsCell: UITableViewCell {

    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var seeMoreButton: UIButton!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.petImage.layer.cornerRadius = 10
        self.petImage.layer.masksToBounds = true
        
        self.seeMoreButton.addViewBorder(borderColor: UIColor.red.cgColor, borderWith: 1.0, borderCornerRadius: 0)
        self.seeMoreButton.layer.cornerRadius = self.seeMoreButton.layer.frame.height/2
        
        let margins = UIEdgeInsets(top: 10, left: 20, bottom: 0, right: 20)
        contentView.frame = contentView.frame.inset(by: margins)
        contentView.backgroundColor = .white
        contentView.layer.masksToBounds = false
    }

}
