//
//  SchedualTestViewController.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 17/12/20.
//

import UIKit
import DropDown
import DatePicker

class SchedualTestViewController: UIViewController {

    /*************  UILabel  ************************/
    @IBOutlet weak var navigationrtext: UILabel!
    @IBOutlet weak var testname: UIView!
    @IBOutlet weak var locationView: UIView!
    @IBOutlet weak var ageView: UIView!
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var chargesView: UIView!
    @IBOutlet weak var otherDetails: UIView!
    
    /*************  DropDown  ************************/
   // @IBOutlet weak var ageDropdown: DropDown!
    
    /*************  UITextField  ************************/
    @IBOutlet weak var testNameText: UITextField!
    @IBOutlet weak var locationText: UITextField!
    //@IBOutlet weak var ageText: DropDown!
   // @IBOutlet weak var dateText: UITextField!
    @IBOutlet weak var timeText: UITextField!
    @IBOutlet weak var chargesText: UITextField!
    @IBOutlet weak var otherDetailsText: UITextField!
    
    @IBOutlet weak var datePickerView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var ageDropdown: UIView!
    @IBOutlet weak var ageResultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBorder()
        datePickerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.datePickerAction(_:))))
        datePickerView.isUserInteractionEnabled = true
        
        ageDropdown.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.ageDropdow(_:))))
        ageDropdown.isUserInteractionEnabled = true
    }
    @objc func ageDropdow(_ gestureRecognizer: UITapGestureRecognizer) {
        let dropDown = DropDown()
        dropDown.anchorView = self.ageDropdown
        dropDown.backgroundColor = .white
        dropDown.cornerRadius = 8
        dropDown.textFont = UIFont(name: "futura", size: 16)!
        dropDown.textColor = .gray
        dropDown.cellHeight = 50
        dropDown.separatorColor = .gray
        dropDown.arrowIndicationX = (dropDown.anchorView?.plainView.frame.width)! - 40
        dropDown.dataSource = ["01 Year", "02 Year", "03 Year", "04 Year", "05 Year"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.ageResultLabel.text = item
            self.ageResultLabel.textColor = .black
            dropDown.hide()
        }
        dropDown.width = 200
        dropDown.show()
    }
    @objc func datePickerAction(_ gestureRecognizer: UITapGestureRecognizer) {
        showDate()
    }
    
    private func showDate() {
        let picker = DatePicker()
        picker.setColors(main: hexStringToUIColor(hex: "#e7143b"), background: .white, inactive: hexStringToUIColor(hex: "#e7143b"))
        picker.setup(beginWith: Date()) { (selected, date) in
            if selected, let selectedDate = date {
                self.dateLabel.text = selectedDate.string()
                self.dateLabel.textColor = .black
            } else {
                print("Cancelled")
            }
        }
        picker.show(in: self)
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    func addBorder() {
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRect(x: 0.0, y: testname.frame.size.height-1, width: testname.frame.width-20, height: 1.0)
        bottomBorder.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        testname.layer.addSublayer(bottomBorder)
        
        let bottomBorderA = CALayer()
        bottomBorderA.frame = CGRect(x: 0.0, y: locationView.frame.size.height-1, width: locationView.frame.width-20, height: 1.0)
        bottomBorderA.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        locationView.layer.addSublayer(bottomBorderA)
        
        let bottomBorderB = CALayer()
        bottomBorderB.frame = CGRect(x: 0.0, y: ageView.frame.size.height-1, width: ageView.frame.width-20, height: 1.0)
        bottomBorderB.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        ageView.layer.addSublayer(bottomBorderB)
        
        let bottomBorderC = CALayer()
        bottomBorderC.frame = CGRect(x: 0.0, y: dateView.frame.size.height-1, width: dateView.frame.width-20, height: 1.0)
        bottomBorderC.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        dateView.layer.addSublayer(bottomBorderC)
        
        let bottomBorderD = CALayer()
        bottomBorderD.frame = CGRect(x: 0.0, y: dateView.frame.size.height-1, width: dateView.frame.width-20, height: 1.0)
        bottomBorderD.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        dateView.layer.addSublayer(bottomBorderD)
        
        let bottomBorderE = CALayer()
        bottomBorderE.frame = CGRect(x: 0.0, y: timeView.frame.size.height-1, width: timeView.frame.width-20, height: 1.0)
        bottomBorderE.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        timeView.layer.addSublayer(bottomBorderE)
        
        let bottomBorderF = CALayer()
        bottomBorderF.frame = CGRect(x: 0.0, y: chargesView.frame.size.height-1, width: chargesView.frame.width-20, height: 1.0)
        bottomBorderF.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        chargesView.layer.addSublayer(bottomBorderF)
        
        let bottomBorderG = CALayer()
        bottomBorderG.frame = CGRect(x: 0.0, y: otherDetails.frame.size.height-1, width: otherDetails.frame.width-20, height: 1.0)
        bottomBorderG.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        otherDetails.layer.addSublayer(bottomBorderG)
    }
}
