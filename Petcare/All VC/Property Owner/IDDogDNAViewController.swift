//
//  IDDogDNAViewController.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 21/12/20.
//

import UIKit

class IDDogDNAViewController: UIViewController {

    @IBOutlet weak var microchipButton: UIButton!
    @IBOutlet weak var readMore: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        microchipButton.addViewBorder(borderColor: UIColor.systemOrange.cgColor, borderWith: 0.5, borderCornerRadius: 24)
        readMore.addViewBorder(borderColor: UIColor.lightGray.cgColor, borderWith: 0.5, borderCornerRadius: 18)
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
