//
//  ContactUsViewControllerSP.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 29/12/20.
//

import UIKit

class ContactUsViewControllerSP: UIViewController {

    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sendButton.layer.cornerRadius = self.sendButton.layer.frame.height/2
        // Do any additional setup after loading the view.
    }

    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
