//
//  EmergencyContactViewController.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 21/12/20.
//

import UIKit


class EmergencyContactViewController: UIViewController {
    
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
    }
    
    @IBAction func activateButtonPressed(_ sender: UIButton) {
        //stepView.showNextStep()
    }
}
