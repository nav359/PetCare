//
//  UserTypeTableViewCell.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 07/12/20.
//

import UIKit

class UserTypeTableViewCell: UITableViewCell {

    @IBOutlet weak var typeImageView: UIImageView!
    
    @IBOutlet weak var typeTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        //reload()
    }
    func reload() {
        if isSelected {
            //typeImageView.textColor = .white
            typeTitle.textColor = .white
        } else {
            //nameLabel.textColor = .black
            typeTitle.textColor = .lightGray
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
