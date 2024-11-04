//
//  File.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 29/12/20.
//

import UIKit

class ClientListViewControllerSP: UIViewController {

    var data = [ClientList]()
    
    @IBOutlet var tableView: UITableView!
    
    let reuseIdentifier = "ClientListTableViewCellSP"
    @IBOutlet weak var navigationTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSetup()
        tableView.separatorStyle = .none
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    func initSetup() {
        navigationTitle.textColor = .white
        //navigationTitle.font = getFont(fontName: "futuraMario500", fontSize: 17)
        
        //Append data to tableview
        data.append(ClientList(id: "1", name: "Jack Ryan", image: ""))
        data.append(ClientList(id: "1", name: "Mason Davis", image: ""))
        data.append(ClientList(id: "1", name: "Elijah Smith", image: ""))
        data.append(ClientList(id: "1", name: "Jack Jones", image: ""))
        data.append(ClientList(id: "1", name: "Oliver Davis", image: ""))
        data.append(ClientList(id: "1", name: "Lucas Smith", image: ""))
        data.append(ClientList(id: "1", name: "Michael Jones", image: ""))
        
        //Table view register nib cell
        tableView.register(UINib.init(nibName: reuseIdentifier, bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    }
}
extension ClientListViewControllerSP: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ClientListTableViewCellSP
        cell.backView.layer.shadowOffset = CGSize(width: 0, height: 1)
        cell.backView.layer.shadowColor = UIColor.lightGray.cgColor
        cell.backView.layer.shadowOpacity = 1
        cell.backView.layer.shadowRadius = 5
        cell.backView.layer.masksToBounds = false
        cell.backView.layer.cornerRadius = 20
        cell.clientname.text = data[indexPath.row].name
        cell.contentView.backgroundColor = .clear
        cell.clientImage.layer.cornerRadius = cell.clientImage.layer.frame.width/2
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let vc = UIStoryboard.init(name: _storyboard_SP, bundle: Bundle.main).instantiateViewController(identifier: _vc_ClientProfileVCSP) as? ClientProfileViewControllerSP
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
