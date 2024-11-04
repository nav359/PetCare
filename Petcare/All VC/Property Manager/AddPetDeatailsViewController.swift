//
//  AddPetDeatailsViewController.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 15/12/20.
//

import UIKit
import DropDown

class AddPetDeatailsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    /*************  UIView  ************************/
    @IBOutlet var nameView: UIView!
    @IBOutlet var heightView: UIView!
    @IBOutlet var weightView: UIView!
    @IBOutlet var DNAtest: UIView!
    //@IBOutlet var robbiesTest: UIView!
    @IBOutlet var community: UIView!
    @IBOutlet var wellnessView: UIView!
    var imagePicker = UIImagePickerController()
    
    /*************  UIButton  ************************/
    @IBOutlet var addPetButton: UIButton!
    
    /*************  UIImageView  ************************/
 
    
    /*************  UILabel  ************************/
    @IBOutlet weak var uploadText: UILabel!
    
    /*************  UIScrollView  ************************/
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet weak var weightDropdownView: UIView!
    @IBOutlet weak var weightRsult: UILabel!
    
    @IBOutlet weak var dnaDropdown: UIView!
    @IBOutlet weak var dnaTestLabel: UILabel!
    
    @IBOutlet weak var robbiesTestDropdown: UIView!
    @IBOutlet weak var robbiesLabel: UILabel!
    
    @IBOutlet weak var communityDropdown: UIView!
    @IBOutlet weak var communityLabel: UILabel!
    
    @IBOutlet weak var petImageView: UIView!
    @IBOutlet weak var cameraView: UIImageView!
    @IBOutlet weak var petImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBorder()
        let contentRect: CGRect = scrollView.subviews.reduce(into: .zero) { rect, view in
            rect = rect.union(view.frame)
        }
        addPetButton.layer.cornerRadius = addPetButton.layer.frame.height/2
        scrollView.contentSize = contentRect.size
        cameraView.layer.cornerRadius = addPetButton.layer.frame.width/2
        cameraView.layer.masksToBounds = false
        
        weightDropdownView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.weightDropdown(_:))))
        weightDropdownView.isUserInteractionEnabled = true
        
        dnaDropdown.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dnaDrop(_:))))
        dnaDropdown.isUserInteractionEnabled = true
        
        robbiesTestDropdown.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.robbiesTestDrop(_:))))
        robbiesTestDropdown.isUserInteractionEnabled = true
        
        communityDropdown.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.communityDrop(_:))))
        communityDropdown.isUserInteractionEnabled = true
        
        
        petImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.viewPrfileAction(_:))))
        petImageView.isUserInteractionEnabled = true
        
        let pictureTap = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        cameraView.addGestureRecognizer(pictureTap)
        cameraView.isUserInteractionEnabled = true
    
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    @objc func imageTapped() {
        myprofile()
    }
    @objc func viewPrfileAction(_ gestureRecognizer: UITapGestureRecognizer) {
        myprofile()
    }
    @objc func communityDrop(_ gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
        let dropDown = DropDown()
        dropDown.anchorView = self.robbiesTestDropdown
        dropDown.backgroundColor = .white
        dropDown.cornerRadius = 8
        dropDown.textFont = UIFont(name: "futura", size: 16)!
        dropDown.textColor = .gray
        dropDown.cellHeight = 50
        dropDown.separatorColor = .gray
        dropDown.arrowIndicationX = .none
        dropDown.dataSource = ["Lorem Ipsum", "Lorem Ipsum", "Lorem Ipsum", "Lorem Ipsum", "Lorem Ipsum"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            communityLabel.text = item
            communityLabel.textColor = .black
            dropDown.hide()
        }
        dropDown.width = 200
        dropDown.show()
    }
    
    @objc func robbiesTestDrop(_ gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
        let dropDown = DropDown()
        dropDown.anchorView = self.robbiesTestDropdown
        dropDown.backgroundColor = .white
        dropDown.cornerRadius = 8
        dropDown.textFont = UIFont(name: "futura", size: 16)!
        dropDown.textColor = .gray
        dropDown.cellHeight = 50
        dropDown.separatorColor = .gray
        dropDown.arrowIndicationX = .none
        dropDown.dataSource = ["Lorem Ipsum", "Lorem Ipsum", "Lorem Ipsum", "Lorem Ipsum", "Lorem Ipsum"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            robbiesLabel.text = item
            robbiesLabel.textColor = .black
            dropDown.hide()
        }
        dropDown.width = 200
        dropDown.show()
    }
    
    @objc func dnaDrop(_ gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
        let dropDown = DropDown()
        dropDown.anchorView = self.dnaDropdown
        dropDown.backgroundColor = .white
        dropDown.cornerRadius = 8
        dropDown.textFont = UIFont(name: "futura", size: 16)!
        dropDown.textColor = .gray
        dropDown.cellHeight = 50
        dropDown.separatorColor = .gray
        dropDown.arrowIndicationX = .none
        dropDown.dataSource = ["Lorem Ipsum", "Lorem Ipsum", "Lorem Ipsum", "Lorem Ipsum", "Lorem Ipsum"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            dnaTestLabel.text = item
            dnaTestLabel.textColor = .black
            dropDown.hide()
        }
        dropDown.width = 200
        dropDown.show()
    }
    
    @objc func weightDropdown(_ gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
        let dropDown = DropDown()
        dropDown.anchorView = self.weightDropdownView
        dropDown.backgroundColor = .white
        dropDown.cornerRadius = 8
        dropDown.textFont = UIFont(name: "futura", size: 16)!
        dropDown.textColor = .gray
        dropDown.cellHeight = 50
        dropDown.separatorColor = .gray
        dropDown.arrowIndicationX = .none
        dropDown.dataSource = ["01 LBS", "02 LBS", "03 LBS", "04 LBS", "05 LBS"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            weightRsult.text = item
            weightRsult.textColor = .black
            dropDown.hide()
        }
        dropDown.width = 200
        dropDown.show()
    }
    @IBAction func backButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
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
        
        petImage.contentMode = .scaleAspectFill
        
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage]as! UIImage
        petImage.image = selectedImage
        
        let imageData = selectedImage.jpegData(compressionQuality: 1.0)!
        let base64String =  imageData.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
        print(base64String)
        //   self.backImageEncodedString = base64String.replacingOccurrences(of: "\r\n", with: "")
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func addBorder() {
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRect(x: 0.0, y: nameView.frame.size.height-1, width: nameView.frame.width-20, height: 1.0)
        bottomBorder.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        nameView.layer.addSublayer(bottomBorder)
        
        let bottomBorderA = CALayer()
        bottomBorderA.frame = CGRect(x: 0.0, y: heightView.frame.size.height-1, width: heightView.frame.width-20, height: 1.0)
        bottomBorderA.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        heightView.layer.addSublayer(bottomBorderA)
        
        let bottomBorderB = CALayer()
        bottomBorderB.frame = CGRect(x: 0.0, y: weightView.frame.size.height-1, width: weightView.frame.width-20, height: 1.0)
        bottomBorderB.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        weightView.layer.addSublayer(bottomBorderB)
        
        let bottomBorderC = CALayer()
        bottomBorderC.frame = CGRect(x: 0.0, y: DNAtest.frame.size.height-1, width: DNAtest.frame.width-20, height: 1.0)
        bottomBorderC.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        DNAtest.layer.addSublayer(bottomBorderC)
        
        let bottomBorderD = CALayer()
        bottomBorderD.frame = CGRect(x: 0.0, y: robbiesTestDropdown.frame.size.height-1, width: robbiesTestDropdown.frame.width-20, height: 1.0)
        bottomBorderD.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        robbiesTestDropdown.layer.addSublayer(bottomBorderD)
        
        let bottomBorderE = CALayer()
        bottomBorderE.frame = CGRect(x: 0.0, y: community.frame.size.height-1, width: community.frame.width-20, height: 1.0)
        bottomBorderE.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        community.layer.addSublayer(bottomBorderE)
        
        let bottomBorderF = CALayer()
        bottomBorderF.frame = CGRect(x: 0.0, y: wellnessView.frame.size.height-1, width: wellnessView.frame.width-20, height: 1.0)
        bottomBorderF.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        wellnessView.layer.addSublayer(bottomBorderF)
    }

}
