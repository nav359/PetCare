//
//  BlogTableViewCell.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 27/12/20.
//

import UIKit

class BlogTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var readMoreButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        readMoreButton.addViewBorder(borderColor: UIColor.red.cgColor, borderWith: 0.5, borderCornerRadius: 12.5)
    }
}
