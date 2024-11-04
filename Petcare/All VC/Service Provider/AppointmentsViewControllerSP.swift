//
//  AppointmentsViewControllerSP.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 29/12/20.
//

import UIKit

class AppointmentsViewControllerSP: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var data = [AppointmentList]()
    
    let reuseIdentifier = "AppointmentsCellSP"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data.append(AppointmentList(regid: "2356", name: "Olivia Roy", service: "Pet Grooming", dateAndTime: "05/08/20 10:33 am"))
        data.append(AppointmentList(regid: "2356", name: "Olivia Roy", service: "Pet Grooming", dateAndTime: "05/08/20 10:33 am"))
        data.append(AppointmentList(regid: "2356", name: "Olivia Roy", service: "Pet Grooming", dateAndTime: "05/08/20 10:33 am"))
        data.append(AppointmentList(regid: "2356", name: "Olivia Roy", service: "Pet Grooming", dateAndTime: "05/08/20 10:33 am"))
        data.append(AppointmentList(regid: "2356", name: "Olivia Roy", service: "Pet Grooming", dateAndTime: "05/08/20 10:33 am"))
        data.append(AppointmentList(regid: "2356", name: "Olivia Roy", service: "Pet Grooming", dateAndTime: "05/08/20 10:33 am"))
        data.append(AppointmentList(regid: "2356", name: "Olivia Roy", service: "Pet Grooming", dateAndTime: "05/08/20 10:33 am"))
        
        
        tableView.register(UINib.init(nibName: reuseIdentifier, bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
extension AppointmentsViewControllerSP: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! AppointmentsCellSP
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        62
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let vc = UIStoryboard.init(name: _storyboard_SP, bundle: Bundle.main).instantiateViewController(identifier: _vc_ClientProfileVCSP) as? ClientProfileViewControllerSP
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
