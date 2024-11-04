//
//  PetDetailsViewControllerSP.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 29/12/20.
//

import UIKit

class PetDetailsViewControllerSP: UIViewController {

    @IBOutlet weak var animalName: UITextField!
    @IBOutlet weak var animalBreed: UITextField!
    @IBOutlet weak var animalGender: UITextField!
    @IBOutlet weak var animalColor: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var dateOfBirth: UITextField!
    @IBOutlet weak var ownerName: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateOfBirth.addTarget(self, action: #selector(datePickerAction), for: .editingDidBegin)
        animalName.addBottomBorderWithColor(color: UIColor.lightGray, width: 0.4)
        animalBreed.addBottomBorderWithColor(color: UIColor.lightGray, width: 0.4)
        weight.addBottomBorderWithColor(color: UIColor.lightGray, width: 0.4)
        dateOfBirth.addBottomBorderWithColor(color: UIColor.lightGray, width: 0.4)
        animalColor.addBottomBorderWithColor(color: UIColor.lightGray, width: 0.4)
        ownerName.addBottomBorderWithColor(color: UIColor.lightGray, width: 0.4)
        animalGender.addBottomBorderWithColor(color: UIColor.lightGray, width: 0.4)
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    @objc func datePickerAction(textField: UITextField) {
        dateOfBirth.resignFirstResponder()
        showDate()
    }
    @IBAction func calenderButtonPressed(_ sender: UIButton) {
        showDate()
    }
    private func showDate() {
//        var style = DefaultStyle()
//        style.pickerColor = StyleColor.color(hexStringToUIColor(hex: "e7143b"))
//        style.pickerMode = .date
//        style.titleString = "Select Date"
//        style.returnDateFormat = .d_m_yyyy
//        style.titleFont = UIFont(name: "futura", size:21)
//        let pick:PresentedViewController = PresentedViewController()
//        pick.style = style
//        pick.block = { [weak self] (date) in
//            self?.dateOfBirth.text = date
//        }
//        self.present(pick, animated: true, completion: nil)
    }
}
