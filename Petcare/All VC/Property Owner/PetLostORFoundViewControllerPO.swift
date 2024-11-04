//
//  PetLostORFoundViewControllerPO.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 23/12/20.
//

import UIKit

class PetLostORFoundViewControllerPO: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
