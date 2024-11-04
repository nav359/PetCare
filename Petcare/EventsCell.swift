//
//  MedicalAwarenessProgramCell.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 17/12/20.
//

import UIKit

class EventsCell: UITableViewCell {

    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var seeMoreButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.petImage.layer.cornerRadius = 10
        self.petImage.layer.masksToBounds = true
        
        self.seeMoreButton.addViewBorder(borderColor: UIColor.red.cgColor, borderWith: 1.0, borderCornerRadius: 0)
        self.seeMoreButton.layer.cornerRadius = self.seeMoreButton.layer.frame.height/2
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
