//
//  TailVetViewController.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 16/12/20.
//

import UIKit

class TailVetViewController: UIViewController {

    /*************  UILabel  ************************/
    @IBOutlet weak var navigationText: UILabel!
    
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
