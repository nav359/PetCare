//
//  ServiceProviderTableViewCell.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 22/12/20.
//

import UIKit

class ServiceProviderTableViewCell: UITableViewCell {
    
    @IBOutlet var providersImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet weak var rightDirectionImage: UIImageView!
    
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
        contentView.layer.cornerRadius = 30
        reload()
    }
    func reload() {
        if isSelected {
            contentView.backgroundColor = hexStringToUIColor(hex: "e7143b")
            nameLabel.textColor = .white
            descriptionLabel.textColor = .white
            rightDirectionImage.tintColor = .white
        } else {
            contentView.backgroundColor = UIColor.white
            nameLabel.textColor = .black
            descriptionLabel.textColor = .lightGray
            rightDirectionImage.tintColor = .black
        }
    }
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
