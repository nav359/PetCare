//
//  PetWellnessViewController.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 25/12/20.
//

import UIKit

class PetWellnessViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
