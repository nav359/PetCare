//
//  EventsViewControllerSP.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 29/12/20.
//

import UIKit

class EventsViewControllerSP: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let reuseIdentifier = "EventsCellSP"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
    
        
        tableView.register(UINib.init(nibName: reuseIdentifier, bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
}
extension EventsViewControllerSP: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! EventsCellSP
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        160
    }
}
