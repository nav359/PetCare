//
//  SubscriptionTableViewCell.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 07/12/20.
//

import UIKit

protocol CellDelegate {
    func subscribeButtonPressed()
}

class SubscriptionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var FourthView: UIView!
    @IBOutlet weak var fifthView: UIView!
    @IBOutlet weak var sixthView: UIView!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var planType: UILabel!
    
    var cellDelegate: CellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        firstView.addTableCellBottomBorderWithColor(color: UIColor.lightGray, width: 0.5)
        secondView.addTableCellBottomBorderWithColor(color: UIColor.lightGray, width: 0.5)
        thirdView.addTableCellBottomBorderWithColor(color: UIColor.lightGray, width: 0.5)
        FourthView.addTableCellBottomBorderWithColor(color: UIColor.lightGray, width: 0.5)
        fifthView.addTableCellBottomBorderWithColor(color: UIColor.lightGray, width: 0.5)
        
        backView.roundCorners([.topRight, .topLeft], radius: 20)
        backImage.layer.masksToBounds = true
        backImage.layer.cornerRadius = 20
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let margins = UIEdgeInsets(top: 10, left: 30, bottom: 10, right: 30)
        contentView.frame = contentView.frame.inset(by: margins)
        contentView.backgroundColor = .white
        contentView.layer.shadowOffset = CGSize(width: 0, height: 1)
        contentView.layer.shadowColor = UIColor.lightGray.cgColor
        contentView.layer.shadowOpacity = 0.5
        contentView.layer.shadowRadius = 5
        contentView.layer.masksToBounds = false
        contentView.layer.cornerRadius = 20
    }
    @IBAction func subscribeButtonPressed(_ sender: UIButton) {
        cellDelegate?.subscribeButtonPressed()
    }
}
extension UIView {
    func addTableCellBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width-27, height: width)
        self.layer.addSublayer(border)
    }
}
extension UIView {
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        if #available(iOS 11, *) {
            var cornerMask = CACornerMask()
            if(corners.contains(.topLeft)){
                cornerMask.insert(.layerMinXMinYCorner)
            }
            if(corners.contains(.topRight)){
                cornerMask.insert(.layerMaxXMinYCorner)
            }
            if(corners.contains(.bottomLeft)){
                cornerMask.insert(.layerMinXMaxYCorner)
            }
            if(corners.contains(.bottomRight)){
                cornerMask.insert(.layerMaxXMaxYCorner)
            }
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = cornerMask

        } else {
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
        }
    }
}
