//
//  SchedualEventsViewController.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 17/12/20.
//

import UIKit

class SchedualEventsViewController: UIViewController {

    @IBOutlet weak var bookAppointment: UIButton!
    @IBOutlet weak var dateView: UITextField!
    @IBOutlet weak var timePick: UITextField!

    fileprivate var singleDate: Date = Date()
    fileprivate var multipleDates: [Date] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bookAppointment.layer.cornerRadius = bookAppointment.layer.frame.height/2
        dateView.addTarget(self, action: #selector(datePickerAction), for: .editingDidBegin)
        timePick.addTarget(self, action: #selector(timePickerAction), for: .editingDidBegin)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    @IBAction func schedulButtonPressed(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "SchedualTestViewController") as? SchedualTestViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func cummunityButtonPressed(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "CommunityProgramViewController") as? CommunityProgramViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func medicalAwareness(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "MedicalAwarenessProgramViewController") as? MedicalAwarenessProgramViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        let transition = CATransition()
        transition.duration = 0.4
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.navigationController?.view.layer.add(transition, forKey: kCATransition)
        self.navigationController?.popViewController(animated: false)
    }
    
    @IBAction func dateButtonPressed(_ sender: UIButton) {
        dateView.resignFirstResponder()
        showDate()
    }
    
    @objc func datePickerAction(textField: UITextField) {
        dateView.resignFirstResponder()
        showDate()
    }
    
    @IBAction func timeButtonPressed(_ sender: UIButton) {
        timePick.resignFirstResponder()
        showTime()
    }
    
    @objc func timePickerAction(textField: UITextField) {
        timePick.resignFirstResponder()
        showTime()
    }
    
    private func showDate() {
        var style = DefaultStyle()
        style.pickerColor = StyleColor.color(hexStringToUIColor(hex: "e7143b"))
        style.pickerMode = .date
        style.titleString = "Select Date"
        style.returnDateFormat = .d_m_yyyy
        style.titleFont = UIFont(name: "futura", size:21)
        let pick:PresentedViewController = PresentedViewController()
        pick.style = style
        pick.block = { [weak self] (date) in
            self?.dateView.text = date
        }
        self.present(pick, animated: true, completion: nil)
    }
    
    private func showTime() {
        var style = DefaultStyle()
        style.pickerColor = StyleColor.color(hexStringToUIColor(hex: "e7143b"))
        style.pickerMode = .time
        style.titleString = "Select Time"
        style.returnDateFormat = .h_mm_PM
        style.titleFont = UIFont(name: "futura", size:21)
        let pick:PresentedViewController = PresentedViewController()
        pick.style = style
        pick.block = { [weak self] (date) in
            self?.timePick.text = date
        }
        self.present(pick, animated: true, completion: nil)
    }
    
}
