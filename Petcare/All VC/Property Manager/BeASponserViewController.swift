//
//  BeASponserViewController.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 19/12/20.
//

import UIKit
import DatePicker
import MobileCoreServices
import SCLAlertView

class BeASponserViewController: UIViewController {

    @IBOutlet var contastTestField: UITextField!
    @IBOutlet var contestPrice: UITextField!
    @IBOutlet var sponserName: UITextField!
    @IBOutlet var sponserID: UITextField!
    @IBOutlet var sponserEmail: UITextField!
    @IBOutlet var sponserContact: UITextField!
    @IBOutlet var otherDetails: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var fileView: UIView!
    @IBOutlet weak var uploadButton: UIButton!
    
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var fileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contastTestField.addViewBorder(borderColor: UIColor.white.cgColor, borderWith: 1.0, borderCornerRadius: 5)
        contastTestField.addPadding(padding: .left(10))
        contestPrice.addViewBorder(borderColor: UIColor.white.cgColor, borderWith: 1.0, borderCornerRadius: 5)
        contestPrice.addPadding(padding: .left(10))
        dateView.addViewBorder(borderColor: UIColor.white.cgColor, borderWith: 1.0, borderCornerRadius: 5)
        //date.addPadding(padding: .left(10))
        sponserName.addViewBorder(borderColor: UIColor.white.cgColor, borderWith: 1.0, borderCornerRadius: 5)
        sponserName.addPadding(padding: .left(10))
        sponserID.addViewBorder(borderColor: UIColor.white.cgColor, borderWith: 1.0, borderCornerRadius: 5)
        sponserID.addPadding(padding: .left(10))
        sponserEmail.addViewBorder(borderColor: UIColor.white.cgColor, borderWith: 1.0, borderCornerRadius: 5)
        sponserEmail.addPadding(padding: .left(10))
        sponserContact.addViewBorder(borderColor: UIColor.white.cgColor, borderWith: 1.0, borderCornerRadius: 5)
        sponserContact.addPadding(padding: .left(10))
        otherDetails.addViewBorder(borderColor: UIColor.white.cgColor, borderWith: 1.0, borderCornerRadius: 5)
        otherDetails.addPadding(padding: .left(10))
        self.submitButton.layer.cornerRadius = self.submitButton.layer.frame.height/2
        self.uploadButton.layer.cornerRadius = self.submitButton.layer.frame.height/2
        
        fileView.layer.shadowOffset = CGSize(width: 0, height: 1)
        fileView.layer.shadowColor = UIColor.lightGray.cgColor
        fileView.layer.shadowOpacity = 0.5
        fileView.layer.shadowRadius = 5
        fileView.layer.masksToBounds = false
        fileView.layer.cornerRadius = 25
        fileView.backgroundColor = .white
        //dateView.addTarget(self, action: #selector(datePickerAction), for: .editingDidBegin)
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.touchTapped(_:)))
        self.dateView.addGestureRecognizer(tap)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(attachDocument))
        fileImage.isUserInteractionEnabled = true
        fileImage.addGestureRecognizer(tapGestureRecognizer)
    }
    @objc func attachDocument() {
        print("Hiii")
        let types = [kUTTypePDF, kUTTypeText, kUTTypeRTF, kUTTypeSpreadsheet]
        let importMenu = UIDocumentPickerViewController(documentTypes: types as [String], in: .import)

        if #available(iOS 11.0, *) {
            importMenu.allowsMultipleSelection = true
        }

        importMenu.delegate = self
        importMenu.modalPresentationStyle = .formSheet

        present(importMenu, animated: true)
    }
    @objc func touchTapped(_ sender: UITapGestureRecognizer) {
        showDate()
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @objc func datePickerAction(textField: UITextField) {
        showDate()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    private func showDate() {
        let picker = DatePicker()
        picker.setColors(main: hexStringToUIColor(hex: "#e7143b"), background: .white, inactive: hexStringToUIColor(hex: "#e7143b"))
        picker.setup(beginWith: Date()) { (selected, date) in
            if selected, let selectedDate = date {
                self.dateLabel.text = selectedDate.string() //setTitle(selectedDate.string(), for: .normal)
            } else {
                print("Cancelled")
            }
        }
        picker.show(in: self)
    }

    @IBAction func uploadButtonAction(_ sender: UIButton) {
        
    }
}
extension BeASponserViewController: UIDocumentPickerDelegate, UINavigationControllerDelegate {
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        //viewModel.attachDocuments(at: urls)
        print(urls)
        let alertView = SCLAlertView()
        alertView.showSuccess("Success!", subTitle: "The document has been uploaded successfully!")
    }

     func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
