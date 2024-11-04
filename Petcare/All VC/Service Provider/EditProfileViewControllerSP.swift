//
//  EditProfileViewControllerSP.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 29/12/20.
//

import UIKit
import DatePicker
import DropDown

class EditProfileViewControllerSP: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var usernameView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var phoneNumberVie: UIView!
    @IBOutlet weak var genderView: UIView!
    @IBOutlet weak var dobView: UIView!
   // @IBOutlet weak var dobTextView: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var cameraButton: UIView!
    var imagePicker = UIImagePickerController()
    //@IBOutlet weak var genderView: UIView!
    
    @IBOutlet weak var genderUIView: UIView!
    @IBOutlet weak var genderResultLabel: UILabel!
    
    @IBOutlet weak var dateOfBirthView: UIView!
    @IBOutlet weak var DOBLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  dobTextView.addTarget(self, action: #selector(datePickerAction), for: .editingDidBegin)
        usernameView.addBottomBorderWithColor(color: UIColor.lightGray, width: 0.5)
        emailView.addBottomBorderWithColor(color: UIColor.lightGray, width: 0.5)
        phoneNumberVie.addBottomBorderWithColor(color: UIColor.lightGray, width: 0.5)
        genderView.addBottomBorderWithColor(color: UIColor.lightGray, width: 0.5)
        //dobTextView.addBottomBorderWithColor(color: UIColor.lightGray, width: 0.5)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleGesture))
        cameraButton.addGestureRecognizer(tap)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        profileImage.isUserInteractionEnabled = true
        profileImage.addGestureRecognizer(tapGestureRecognizer)
        
        genderUIView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.ageDropdown(_:))))
        genderUIView.isUserInteractionEnabled = true
        
        dateOfBirthView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.ageDropdowna(_:))))
        dateOfBirthView.isUserInteractionEnabled = true
        
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    @objc func ageDropdown(_ gestureRecognizer: UITapGestureRecognizer) {
        AppDropdown()
    } 
    @objc func ageDropdowna(_ gestureRecognizer: UITapGestureRecognizer) {
        showDate()
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        myprofile()
    }
    @objc func handleGesture(gesture: UITapGestureRecognizer) -> Void {
        myprofile()
    }
    func myprofile() {
        
        imagePicker.delegate = self
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.openCamera()
        }))
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.openGallary()
        }))
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    func openCamera() {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera)) {
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        } else {
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    func openGallary() {
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        profileImage.contentMode = .scaleAspectFill
        
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage]as! UIImage
        profileImage.image = selectedImage
        
        let imageData = selectedImage.jpegData(compressionQuality: 1.0)!
        let base64String =  imageData.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
        print(base64String)
        //   self.backImageEncodedString = base64String.replacingOccurrences(of: "\r\n", with: "")
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    private func showDate() {
        let picker = DatePicker()
        picker.setColors(main: hexStringToUIColor(hex: "#e7143b"), background: .white, inactive: hexStringToUIColor(hex: "#e7143b"))
        picker.setup(beginWith: Date()) { (selected, date) in
            if selected, let selectedDate = date {
                self.DOBLabel.text = selectedDate.string()
            } else {
                print("Cancelled")
            }
        }
        picker.show(in: self)
    }
    func AppDropdown() {
        let dropDown = DropDown()
        dropDown.anchorView = self.genderUIView
        dropDown.backgroundColor = .white
        dropDown.cornerRadius = 8
        dropDown.textFont = UIFont(name: "futura", size: 16)!
        dropDown.textColor = .gray
        dropDown.cellHeight = 50
        dropDown.separatorColor = .gray
        
        dropDown.arrowIndicationX = (dropDown.anchorView?.plainView.frame.width)! - 40
        dropDown.dataSource = ["Male", "Female"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.genderResultLabel.text = item
            dropDown.hide()
        }
        dropDown.width = 200
        dropDown.show()
      }
}
