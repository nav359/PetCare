//
//  NotificationViewController.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 19/12/20.
//

import UIKit

class NotificationViewController: UIViewController {
    
    var NotificationArray = [Notification]()
    
    @IBOutlet weak var tableView: UITableView!
    
    let reuseIdentifier = "NotificationTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationArray.append(Notification(id: "1", title: "Jack Rayan", description: "In this example, we filled we data an array named Items, and we removing the chosen item from the list when the user swipes left and press the delete button (or just swipes left all the way through", time: "10:10", readOrUndread: false))
        NotificationArray.append(Notification(id: "1", title: "Mark Rayan", description: "In this example, we filled we data an array named Items, and we removing the chosen item from the list when the user swipes left and press the delete button (or just swipes left all the way through", time: "03:10", readOrUndread: false))
        NotificationArray.append(Notification(id: "1", title: "Thomas Bolt", description: "In this example, we filled we data an array named Items, and we removing the chosen item from the list when the user swipes left and press the delete button (or just swipes left all the way through", time: "10:10", readOrUndread: true))
        NotificationArray.append(Notification(id: "1", title: "Green Sith", description: "In this example, we filled we data an array named Items, and we removing the chosen item from the list when the user swipes left and press the delete button (or just swipes left all the way through", time: "11:10", readOrUndread: true))
        NotificationArray.append(Notification(id: "1", title: "Pet Cummins", description: "In this example, we filled we data an array named Items, and we removing the chosen item from the list when the user swipes left and press the delete button (or just swipes left all the way through", time: "07:10", readOrUndread: false))
        NotificationArray.append(Notification(id: "1", title: "Rock Rayan", description: "In this example, we filled we data an array named Items, and we removing the chosen item from the list when the user swipes left and press the delete button (or just swipes left all the way through", time: "10:10", readOrUndread: true))
        NotificationArray.append(Notification(id: "1", title: "Jack Rayan", description: "In this example, we filled we data an array named Items, and we removing the chosen item from the list when the user swipes left and press the delete button (or just swipes left all the way through", time: "10:10", readOrUndread: true))
        NotificationArray.append(Notification(id: "1", title: "Jack Rayan", description: "In this example, we filled we data an array named Items, and we removing the chosen item from the list when the user swipes left and press the delete button (or just swipes left all the way through", time: "12:11", readOrUndread: false))
        NotificationArray.append(Notification(id: "1", title: "Jack Rayan", description: "In this example, we filled we data an array named Items, and we removing the chosen item from the list when the user swipes left and press the delete button (or just swipes left all the way through", time: "15:16", readOrUndread: true))
        NotificationArray.append(Notification(id: "1", title: "Jack Rayan", description: "In this example, we filled we data an array named Items, and we removing the chosen item from the list when the user swipes left and press the delete button (or just swipes left all the way through", time: "20:12", readOrUndread: false))
        
        self.tableView.separatorStyle = .none
        self.tableView.rowHeight = 105
        self.tableView.estimatedRowHeight = 105
        self.tableView.delegate = self
        
        tableView.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
extension NotificationViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        NotificationArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! NotificationTableViewCell
        cell.title.text = NotificationArray[indexPath.row].title
        cell.descriptionLabel.text = NotificationArray[indexPath.row].description
        cell.newLabel.isHidden = NotificationArray[indexPath.row].readOrUndread
        cell.timeLabel.text = NotificationArray[indexPath.row].time
        return cell
    }
    @available(iOS 11.0, *)
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { _, _, complete in
            self.NotificationArray.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            complete(true)
        }
        
        // here set your image and background color
        deleteAction.image = UIImage(named: "29")
        deleteAction.backgroundColor = .red
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = true
        return configuration
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, _ in
            self.NotificationArray.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        deleteAction.backgroundColor = .red
        return [deleteAction]
    }
}
