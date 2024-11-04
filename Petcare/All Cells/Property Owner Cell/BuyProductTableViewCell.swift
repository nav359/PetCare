//
//  BuyProductTableViewCell.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 25/12/20.
//

import Cosmos
import UIKit

protocol BuyDelegate {
    func triggerBuyNow()
}

class BuyProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var discountedPrice: UILabel!
    @IBOutlet weak var sellingPrice: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var addToWishlist: UIButton!
    @IBOutlet weak var addToCompare: UIButton!
    @IBOutlet weak var buyNowButton: UIButton!
    
    var BuyDelegate: BuyDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        buyNowButton.layer.borderWidth = 0.5
        buyNowButton.layer.borderColor = UIColor.red.cgColor
    }

    @IBAction func buyNowButtonActio(_ sender: Any) {
        BuyDelegate?.triggerBuyNow()
    }
}
