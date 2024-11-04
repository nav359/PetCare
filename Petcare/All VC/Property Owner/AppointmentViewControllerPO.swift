//
//  AppointmentViewControllerPO.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 23/12/20.
//

import UIKit
import DropDown
import DatePicker

class AppointmentViewControllerPO: UIViewController {

    @IBOutlet weak var bookAppointment: UIButton!
    @IBOutlet weak var selectButton: UIButton!
    @IBOutlet weak var selectDate: UIButton!

    @IBOutlet weak var selectTime: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate var singleDate: Date = Date()
    fileprivate var multipleDates: [Date] = []
    var data = [SelectTime]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data.append(SelectTime(id: "1", time: "10:00 AM"))
        data.append(SelectTime(id: "1", time: "12:00 AM"))
        data.append(SelectTime(id: "1", time: "02:00 PM"))
        data.append(SelectTime(id: "1", time: "04:00 PM"))
        data.append(SelectTime(id: "1", time: "05:00 PM"))
        data.append(SelectTime(id: "1", time: "07:00 PM"))
        
        self.bookAppointment.layer.cornerRadius = bookAppointment.layer.frame.height/2
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        self.collectionView.collectionViewLayout = flowLayout
        self.collectionView.showsHorizontalScrollIndicator = false
        
        //Comment if you set Datasource and delegate in .xib
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        //Register the xib for collection view cell
        self.collectionView.register(UINib(nibName: "TimeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TimeCollectionViewCell")
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
   
    @IBAction func selectButton(_ sender: UIButton) {
        self.view.endEditing(true)
        AppDropdown()
    }
    
    @IBAction func selectDate(_ sender: Any) {
        self.view.endEditing(false)
        self.resignFirstResponder()
        showDate()
    }
    func AppDropdown() {
        let dropDown = DropDown()
        dropDown.anchorView = self.selectButton
        dropDown.backgroundColor = .white
        dropDown.cornerRadius = 8
        dropDown.textFont = UIFont(name: "futura", size: 16)!
        dropDown.textColor = .gray
        dropDown.cellHeight = 50
        dropDown.separatorColor = .gray
        
        dropDown.arrowIndicationX = (dropDown.anchorView?.plainView.frame.width)! - 40
        dropDown.dataSource = ["A1", "A2", "A3", "A4", "A5"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            selectButton.setTitle(item, for: .normal)
            selectButton.setTitleColor(.black, for: .normal)
            dropDown.hide()
        }
        dropDown.width = 200
        dropDown.show()
      }

    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func timeButtonPressed(_ sender: UIButton) {
        self.view.endEditing(true)
        //showTime()
    }
    
    @objc func timePickerAction(textField: UITextField) {
        self.view.endEditing(true)
        //showTime()
    }
    
    @IBAction func selectTime(_ sender: UIButton) {
        
    }
    
    private func showDate() {
        let picker = DatePicker()
        picker.setColors(main: hexStringToUIColor(hex: "#e7143b"), background: .white, inactive: hexStringToUIColor(hex: "#e7143b"))
        picker.setup(beginWith: Date()) { (selected, date) in
            if selected, let selectedDate = date {
                self.selectDate.setTitle(selectedDate.string(), for: .normal)
                self.selectDate.setTitleColor(.black, for: .normal)
            } else {
                print("Cancelled")
            }
        }
        picker.show(in: self)
    }
    
}
extension AppointmentViewControllerPO: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TimeCollectionViewCell", for: indexPath) as! TimeCollectionViewCell
        cell.backView.layer.cornerRadius = cell.backView.layer.frame.height/2-2
        cell.timeLabel.text =  data[indexPath.row].time
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
extension AppointmentViewControllerPO: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.size.width/3.9), height: (view.frame.size.width/10.2))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
}
extension AppointmentViewControllerPO {
    @IBAction func schedulButtonPressed(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: _storyboard_main, bundle: Bundle.main).instantiateViewController(identifier: _vc_SchedualTestVC) as? SchedualTestViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func cummunityButtonPressed(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: _storyboard_main, bundle: Bundle.main).instantiateViewController(identifier: _vc_CommunityPrograVC) as? CommunityProgramViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func medicalAwareness(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: _storyboard_main, bundle: Bundle.main).instantiateViewController(identifier: _vc_MedicalAwarenessVC) as? MedicalAwarenessProgramViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
