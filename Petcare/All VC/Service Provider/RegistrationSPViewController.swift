//
//  RegistrationSPViewController.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 01/01/21.
//

import UIKit

class RegistrationSPViewController: UIViewController {

    
    @IBOutlet var companyName: UITextField!
    @IBOutlet var name: UITextField!
    @IBOutlet var position: UITextField!
    @IBOutlet var companyNumber: UITextField!
    @IBOutlet var businessAddress: UITextField!
    @IBOutlet var cityStateZip: UITextField!
    @IBOutlet var companyWebsite: UITextField!
    @IBOutlet var companyServiceOne: UITextField!
    @IBOutlet var companyServiceTwo: UITextField!
    @IBOutlet var companyServiceThree: UITextField!
    @IBOutlet var companyDisclaimersOne: UITextField!
    @IBOutlet var companyDisclaimersTwo: UITextField!
    @IBOutlet var companyDisclaimersThree: UITextField!
    @IBOutlet var operationHoursOne: UITextField!
    @IBOutlet var operationHoursTwo: UITextField!
    @IBOutlet var operationHoursThree: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        companyName.addBottomBorderWithColorPet(color: UIColor.lightGray, width: 0.5)
        name.addBottomBorderWithColorPet(color: UIColor.lightGray, width: 0.5)
        position.addBottomBorderWithColorPet(color: UIColor.lightGray, width: 0.5)
        companyNumber.addBottomBorderWithColorPet(color: UIColor.lightGray, width: 0.5)
        businessAddress.addBottomBorderWithColorPet(color: UIColor.lightGray, width: 0.5)
        cityStateZip.addBottomBorderWithColorPet(color: UIColor.lightGray, width: 0.5)
        companyWebsite.addBottomBorderWithColorPet(color: UIColor.lightGray, width: 0.5)
        companyServiceOne.addBottomBorderWithColorPet(color: UIColor.lightGray, width: 0.5)
        companyServiceTwo.addBottomBorderWithColorPet(color: UIColor.lightGray, width: 0.5)
        companyServiceThree.addBottomBorderWithColorPet(color: UIColor.lightGray, width: 0.5)
        companyDisclaimersOne.addBottomBorderWithColorPet(color: UIColor.lightGray, width: 0.5)
        companyDisclaimersTwo.addBottomBorderWithColorPet(color: UIColor.lightGray, width: 0.5)
        companyDisclaimersThree.addBottomBorderWithColorPet(color: UIColor.lightGray, width: 0.5)
        operationHoursOne.addBottomBorderWithColorPet(color: UIColor.lightGray, width: 0.5)
        operationHoursTwo.addBottomBorderWithColorPet(color: UIColor.lightGray, width: 0.5)
        operationHoursThree.addBottomBorderWithColorPet(color: UIColor.lightGray, width: 0.5)
    }

    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
