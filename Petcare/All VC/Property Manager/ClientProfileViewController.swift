//
//  ClientProfileViewController.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 16/12/20.
//

import UIKit

class ClientProfileViewController: UIViewController {

    /*************  UILabel  ************************/
    @IBOutlet weak var navigationText: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var emailText: UILabel!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var positionTitle: UILabel!
    @IBOutlet weak var sellerPosition: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var companyNumber: UILabel!
    @IBOutlet weak var bussinessAddress: UILabel!
    @IBOutlet weak var bussinessAddressLabel: UILabel!
    @IBOutlet weak var cityStateZip: UILabel!
    @IBOutlet weak var cityZipStateLabek: UILabel!
    @IBOutlet weak var companyWebsite: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    
    /*************  UIView  ************************/
    @IBOutlet weak var profileUIView: UIView!
    
    /*************  UIImageView  ************************/
    @IBOutlet weak var userProfileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileUIView.layer.cornerRadius = profileUIView.layer.frame.width/2
        profileUIView.layer.masksToBounds = false
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
