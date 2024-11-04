//
//  LoginViewController.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 07/12/20.
//

import UIKit
import SCLAlertView

class LoginViewController: UIViewController {

    
    @IBOutlet weak var dontHaveAccount: UILabel!
    @IBOutlet weak var remeberPassword: UILabel!
    @IBOutlet weak var forgotPassword: UILabel!
    @IBOutlet weak var orLabel: UILabel!
    
    @IBOutlet weak var emailBottomView: UIView!
    @IBOutlet weak var passwordView: UIView!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var faceBookButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var checkBoxButton: UIButton!
    @IBOutlet weak var registerNowButton: UIButton!
    
    @IBOutlet weak var emailTextFiedl: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
  
    var userType: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(userType)
        
        self.loginButton.layer.cornerRadius = self.loginButton.layer.frame.height/2
        self.loginButton.layer.backgroundColor = hexStringToUIColor(hex: "#e7143b").cgColor
        
        self.faceBookButton.layer.cornerRadius = self.faceBookButton.layer.frame.height/2
        
        self.googleButton.layer.cornerRadius = self.googleButton.layer.frame.height/2
        self.googleButton.backgroundColor = .clear
        self.googleButton.layer.cornerRadius = self.googleButton.layer.frame.height/2
        self.googleButton.layer.borderWidth = 1
        self.googleButton.layer.borderColor = UIColor.black.cgColor
        
        let bottomBordera = CALayer()
        bottomBordera.frame = CGRect(x: 0.0, y: emailBottomView.frame.size.height-1, width: emailBottomView.frame.width-20, height: 1.0)
        bottomBordera.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        emailBottomView.layer.addSublayer(bottomBordera)
        
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRect(x: 0.0, y: passwordView.frame.size.height-1, width: passwordView.frame.width-20, height: 1.0)
        bottomBorder.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        passwordView.layer.addSublayer(bottomBorder)
        //checkbox
        checkBoxButton.setBackgroundImage(UIImage(named: "unchecked"), for: .normal)
        checkBoxButton.setBackgroundImage(UIImage(named: "checked"), for: .selected)
    }
    
    @IBAction func checkBoxButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        if emailTextFiedl.text!.isValidEmail {
            if passwordTextField.text!.count > 5 {
                let vc = UIStoryboard.init(name: _storyboard_main, bundle: nil).instantiateViewController(withIdentifier: _vc_SubscriptionPlanVC) as? SubscriptionPlanViewController
                vc?.userType = userType
                self.navigationController?.pushViewController(vc!, animated: true)
            } else {
                self.alert(message: "Please enter password more than 5 characters")
            }
        } else {
            self.alert(message: "Please check your email address carefully?")
        }
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        if userType == "Pet Owners" {
            let vc = UIStoryboard.init(name: _storyboard_PO, bundle: nil).instantiateViewController(withIdentifier: _vc_RegistrationVCPO) as? RegistrationViewControllerPO
            vc!.modalPresentationStyle = .fullScreen
            self.present(vc!, animated: true, completion: nil)
        } else if userType == "Property Managers" {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: _vc_RegistrationVC) as! RegistrationViewController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        } else if userType == "Pet Services Provider" {
            let vc = UIStoryboard.init(name: _storyboard_SP, bundle: nil).instantiateViewController(withIdentifier: _vc_RegistrationSPVC) as? RegistrationSPViewController
            vc!.modalPresentationStyle = .fullScreen
            self.present(vc!, animated: true, completion: nil)
        }
    }
    
}
extension UIViewController {
    func alert(message: String) {
        let appearance = SCLAlertView.SCLAppearance(
            kTitleFont: UIFont(name: "futura", size: 20)!,
            kTextFont: UIFont(name: "futura", size: 14)!,
            kButtonFont: UIFont(name: "futura", size: 14)!,
            showCloseButton: true
        )
        SCLAlertView(appearance: appearance).showError("Error!", subTitle: message)
    }
}
extension String {
    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
}
