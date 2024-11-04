//
//  TailVetViewControllerPO.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 24/12/20.
//

import UIKit

class TailVetViewControllerPO: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}
