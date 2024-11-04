//
//  RegistrationViewController.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 07/12/20.
//

import UIKit

class RegistrationViewController: UIViewController {

    /*************  UIViews  ************************/
    @IBOutlet weak var firstName: UIView!
    @IBOutlet weak var lastname: UIView!
    @IBOutlet weak var phoneNumber: UIView!
    @IBOutlet weak var email: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var comfirmPassword: UIView!
    
    /*************  TextField  ************************/
    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var lastnameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var phoneNumberText: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var cpassword: UITextField!
   
    /*************  Label  ************************/
    @IBOutlet weak var alreadyAccount: UILabel!
    
    
    /*************  Button  ************************/
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        borderViews()
        self.registerButton.layer.backgroundColor = hexStringToUIColor(hex: "#e7143b").cgColor
        self.registerButton.layer.cornerRadius = self.registerButton.layer.frame.height/2
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        if emailText.text!.isValidEmail {
            let vc = UIStoryboard.init(name: _storyboard_main, bundle: nil).instantiateViewController(withIdentifier: _vc_SubscriptionPlanVC) as? SubscriptionPlanViewController
            self.navigationController?.pushViewController(vc!, animated: true)
        } else {
            self.alert(message: "Please check your email address carefully?")
        }
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    func borderViews() {
        let bottomBordera = CALayer()
        bottomBordera.frame = CGRect(x: 0.0, y: firstName.frame.size.height-1, width: firstName.frame.width-20, height: 1.0)
        bottomBordera.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        firstName.layer.addSublayer(bottomBordera)
        
        let bottomBorderb = CALayer()
        bottomBorderb.frame = CGRect(x: 0.0, y: lastname.frame.size.height-1, width: lastname.frame.width-20, height: 1.0)
        bottomBorderb.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        lastname.layer.addSublayer(bottomBorderb)
        
        let bottomBorderc = CALayer()
        bottomBorderc.frame = CGRect(x: 0.0, y: phoneNumber.frame.size.height-1, width: phoneNumber.frame.width-20, height: 1.0)
        bottomBorderc.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        phoneNumber.layer.addSublayer(bottomBorderc)
        
        let bottomBorderd = CALayer()
        bottomBorderd.frame = CGRect(x: 0.0, y: phoneNumber.frame.size.height-1, width: phoneNumber.frame.width-20, height: 1.0)
        bottomBorderd.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        phoneNumber.layer.addSublayer(bottomBorderd)
        
        let bottomBordere = CALayer()
        bottomBordere.frame = CGRect(x: 0.0, y: email.frame.size.height-1, width: email.frame.width-20, height: 1.0)
        bottomBordere.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        email.layer.addSublayer(bottomBordere)
        
        let bottomBorderf = CALayer()
        bottomBorderf.frame = CGRect(x: 0.0, y: passwordView.frame.size.height-1, width: passwordView.frame.width-20, height: 1.0)
        bottomBorderf.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        passwordView.layer.addSublayer(bottomBorderf)
        
        let bottomBorderg = CALayer()
        bottomBorderg.frame = CGRect(x: 0.0, y: comfirmPassword.frame.size.height-1, width: comfirmPassword.frame.width-20, height: 1.0)
        bottomBorderg.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        comfirmPassword.layer.addSublayer(bottomBorderg)
    }
}
