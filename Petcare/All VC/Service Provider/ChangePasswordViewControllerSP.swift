//
//  ChangePasswordViewControllerSP.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 29/12/20.
//

import UIKit

class ChangePasswordViewControllerSP: UIViewController {

    @IBOutlet weak var currentPassword: UITextField!
    @IBOutlet weak var newPassword: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var updateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentPassword.addBottomBorderWithColor(color: UIColor.gray, width: 0.5)
        newPassword.addBottomBorderWithColor(color: UIColor.gray, width: 0.5)
        confirmPassword.addBottomBorderWithColor(color: UIColor.gray, width: 0.5)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
