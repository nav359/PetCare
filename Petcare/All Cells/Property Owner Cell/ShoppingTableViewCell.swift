//
//  ShoppingTableViewCell.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 25/12/20.
//

import UIKit

class ShoppingTableViewCell: UITableViewCell {

    @IBOutlet weak var saveForLatter: UIButton!
    @IBOutlet weak var removeButton: UIButton!
    
    @IBOutlet weak var quantityButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        saveForLatter.addViewBorder(borderColor: UIColor.gray.cgColor, borderWith: 0.5, borderCornerRadius: 17.5)
        removeButton.addViewBorder(borderColor: UIColor.gray.cgColor, borderWith: 0.5, borderCornerRadius: 17.5)
        quantityButton.addViewBorder(borderColor: UIColor.red.cgColor, borderWith: 0.5, borderCornerRadius: 15)
    }
}
