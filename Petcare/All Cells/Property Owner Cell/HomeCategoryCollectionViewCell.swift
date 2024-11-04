//
//  HomeCategoryCollectionViewCell.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 21/12/20.
//

import UIKit

class HomeCategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.layer.cornerRadius = 20.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.lightGray.cgColor
        self.contentView.layer.masksToBounds = true
        self.layer.masksToBounds = false
    }
}
