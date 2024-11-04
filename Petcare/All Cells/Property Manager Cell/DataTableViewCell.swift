//
//  DataTableViewCell.swift
//  Interview Task
//
//  Created by Navdeep Paliwal on 05/12/20.
//

import UIKit

class DataTableViewCell: UITableViewCell {
    
    //Back Views
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var idView: UIView!
    @IBOutlet weak var petNameView: UIView!
    @IBOutlet weak var moveInDate: UIView!
    @IBOutlet weak var LocationView: UIView!
    @IBOutlet weak var statusView: UIView!
    //Labels
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var petNameLabel: UILabel!
    @IBOutlet weak var moveInDateLabel: UILabel!
    @IBOutlet weak var locationlabel: UILabel!
    //@IBOutlet weak var satatusLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        idView.addViewBorder(borderColor: #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1), borderWith: 0.3, borderCornerRadius: 0)
        petNameView.addViewBorder(borderColor: #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1), borderWith: 0.3, borderCornerRadius: 0)
        moveInDate.addViewBorder(borderColor: #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1), borderWith: 0.3, borderCornerRadius: 0)
        LocationView.addViewBorder(borderColor: #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1), borderWith: 0.3, borderCornerRadius: 0)
        statusView.addViewBorder(borderColor: #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1), borderWith: 0.3, borderCornerRadius: 0)
    }
}
