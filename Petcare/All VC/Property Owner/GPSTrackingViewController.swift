//
//  GPSTrackingViewController.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 23/12/20.
//

import UIKit

class GPSTrackingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
