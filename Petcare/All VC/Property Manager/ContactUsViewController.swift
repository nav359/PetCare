//
//  ContactUsViewController.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 19/12/20.
//

import UIKit

class ContactUsViewController: UIViewController {

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
