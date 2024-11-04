//
//  LostAndFoundViewController.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 16/12/20.
//

import UIKit

class LostAndFoundViewController: UIViewController {

    /*************  UILabel  ************************/
    @IBOutlet weak var navigationText: UILabel!
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var verifyText: UILabel!
    @IBOutlet weak var emergencyContactTitle: UILabel!
    
    /*************  UITextField  ************************/
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberText: UITextField!
    @IBOutlet weak var emailtext: UITextField!
    @IBOutlet weak var petIDtagCode: UITextField!

    /*************  UIButton  ************************/
    @IBOutlet weak var findPetOwner: UIButton!
    @IBOutlet weak var reportPetLost: UIButton!
    @IBOutlet weak var findOwnerbtn: UIButton!
    @IBOutlet weak var reportAPetLost: UIButton!
    
    /*************  UIView  ************************/
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var PhoneNumber: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var petID: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameView.addViewBorder(borderColor: UIColor.red.cgColor, borderWith: 0.5, borderCornerRadius: 5)
        PhoneNumber.addViewBorder(borderColor: UIColor.red.cgColor, borderWith: 0.5, borderCornerRadius: 5)
        emailView.addViewBorder(borderColor: UIColor.red.cgColor, borderWith: 0.5, borderCornerRadius: 5)
        petID.addViewBorder(borderColor: UIColor.red.cgColor, borderWith: 0.5, borderCornerRadius: 5)
        findOwnerbtn.addViewBorder(borderColor: UIColor.red.cgColor, borderWith: 0.5, borderCornerRadius: 5)
        findOwnerbtn.layer.cornerRadius = findOwnerbtn.layer.frame.height/2
        reportAPetLost.layer.cornerRadius = reportAPetLost.layer.frame.height/2
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
}
