//
//  PetDetailsViewController.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 22/12/20.
//

import UIKit
import DatePicker
import DropDown

class PetDetailsViewController: UIViewController {

    @IBOutlet weak var animalName: UITextField!
    @IBOutlet weak var animalBreed: UITextField!
    @IBOutlet weak var animalColor: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var dateOfBirth: UITextField!
    @IBOutlet weak var ownerName: UITextField!
    @IBOutlet weak var genderDropdown: DropDown!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genderDropdown.addBottomBorderWithColor(color: UIColor.lightGray, width: 0.25)
        animalName.addBottomBorderWithColor(color: UIColor.lightGray, width: 0.25)
        animalBreed.addBottomBorderWithColor(color: UIColor.lightGray, width: 0.25)
        weight.addBottomBorderWithColor(color: UIColor.lightGray, width: 0.25)
        dateOfBirth.addBottomBorderWithColor(color: UIColor.lightGray, width: 0.25)
        animalColor.addBottomBorderWithColor(color: UIColor.lightGray, width: 0.25)
        ownerName.addBottomBorderWithColor(color: UIColor.lightGray, width: 0.25)
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}
