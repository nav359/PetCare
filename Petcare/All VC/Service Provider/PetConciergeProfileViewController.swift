//
//  PetConciergeProfileViewController.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 28/12/20.
//

import UIKit
import DropDown

class PetConciergeProfileViewController: UIViewController {

    /*************  UITextField  ************************/
    @IBOutlet weak var imageText: UITextField!
    @IBOutlet weak var addName: UITextField!
    @IBOutlet weak var addServices: UITextField!
   // @IBOutlet weak var workingSerius: UITextField!
    @IBOutlet weak var otherDetails: UITextField!
    
    /*************  UILabel  ************************/
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var navigationTitle: UILabel!
    
    /*************  UIButton  ************************/
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var workingAres: UIView!
    @IBOutlet weak var workingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageText.addBottomBorderWithColorPet(color: UIColor.lightGray, width: 0.5)
        addName.addBottomBorderWithColorPet(color: UIColor.lightGray, width: 0.5)
        addServices.addBottomBorderWithColorPet(color: UIColor.lightGray, width: 0.5)
        workingAres.addBottomBorderWithColorPet(color: UIColor.lightGray, width: 0.5)
        otherDetails.addBottomBorderWithColorPet(color: UIColor.lightGray, width: 0.5)
        workingAres.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.workingDropdown(_:))))
        workingAres.isUserInteractionEnabled = true
    }
    func initSetup() {
        let color = hexStringToUIColor(hex: "999994")
        imageText.textColor = color
        //imageText.font = getFont(fontName: "futuraMario500", fontSize: 15)
        addName.textColor = color
        //addName.font = getFont(fontName: "futuraMario500", fontSize: 15)
        addServices.textColor = color
        //addServices.font = getFont(fontName: "futuraMario500", fontSize: 15)
        //workingSerius.textColor = color
        //workingSerius.font = getFont(fontName: "futuraMario500", fontSize: 15)
        otherDetails.textColor = color
        //otherDetails.font = getFont(fontName: "futuraMario500", fontSize: 15)
        descriptionLabel.textColor = color
        //descriptionLabel.font = getFont(fontName: "futuraMario500", fontSize: 15)
        addButton.titleLabel?.textColor = .white
        //addButton.font = getFont(fontName: "futuraMario500", fontSize: 15)
        navigationTitle.textColor = .black
        //navigationTitle.font = getFont(fontName: "futuraMario500", fontSize: 15)
        
        
    }
    @objc func workingDropdown(_ gestureRecognizer: UITapGestureRecognizer) {
        AppDropdown()
    }
    func AppDropdown() {
        let dropDown = DropDown()
        dropDown.anchorView = self.workingAres
        dropDown.backgroundColor = .white
        dropDown.cornerRadius = 8
        dropDown.textFont = UIFont(name: "futura", size: 16)!
        dropDown.textColor = .gray
        dropDown.cellHeight = 50
        dropDown.separatorColor = .gray
        
        dropDown.arrowIndicationX = (dropDown.anchorView?.plainView.frame.width)! - 40
        dropDown.dataSource = ["Lorem Ipsum", "Lorem Ipsum", "Lorem Ipsum", "Lorem Ipsum", "Lorem Ipsum"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            //selectButton.setTitle(item, for: .normal)
            //selectButton.setTitleColor(.black, for: .normal)
            self.workingLabel.text = item
            self.workingLabel.textColor = .black
            dropDown.hide()
        }
        dropDown.width = 200
        dropDown.show()
      }

    @IBAction func dismisButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
extension UIView {
    func addBottomBorderWithColorPet(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width-15, height: width)
        self.layer.addSublayer(border)
    }
}
