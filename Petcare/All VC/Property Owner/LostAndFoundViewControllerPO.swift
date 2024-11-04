//
//  LostAndFoundViewControllerPO.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 22/12/20.
//

import UIKit

class LostAndFoundViewControllerPO: UIViewController {

    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var PhoneNumber: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var petID: UIView!
    @IBOutlet weak var findOwnerbtn: UIButton!
    @IBOutlet weak var reportAPetLost: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameView.addViewBorder(borderColor: UIColor.red.cgColor, borderWith: 0.5, borderCornerRadius: 5)
        PhoneNumber.addViewBorder(borderColor: UIColor.red.cgColor, borderWith: 0.5, borderCornerRadius: 5)
        emailView.addViewBorder(borderColor: UIColor.red.cgColor, borderWith: 0.5, borderCornerRadius: 5)
        petID.addViewBorder(borderColor: UIColor.red.cgColor, borderWith: 0.5, borderCornerRadius: 5)
        findOwnerbtn.addViewBorder(borderColor: UIColor.red.cgColor, borderWith: 0.5, borderCornerRadius: 5)
        findOwnerbtn.layer.cornerRadius = findOwnerbtn.layer.frame.height/2
        reportAPetLost.layer.cornerRadius = reportAPetLost.layer.frame.height/2
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
}
