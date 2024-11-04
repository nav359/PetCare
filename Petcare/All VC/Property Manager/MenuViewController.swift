//
//  MenuViewController.swift
//  PMG Classes
//
//  Created by Navdeep Paliwal on 23/04/20.
//  Copyright © 2020 Navdeep Paliwal. All rights reserved.
//

import UIKit

enum MenuType: Int {
    case addPet
    case clients
    case lostAndFound
    case appointments
    case vaccation
    case maps
    case tailAvet
    case events
    case vitalDocuments
    case cuteDog
    case beASponser
}

class MenuViewController: UITableViewController {
    
    /*************  UIImageView  ************************/
    @IBOutlet weak var userProfileImage: UIImageView!
    
    /*************  UILabel  ************************/
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userType: UILabel!
    @IBOutlet weak var addPet: UILabel!
    @IBOutlet weak var clients: UILabel!
    @IBOutlet weak var lostAndFound: UILabel!
    @IBOutlet weak var appointments: UILabel!
    @IBOutlet weak var vaccination: UILabel!
    @IBOutlet weak var map: UILabel!
    @IBOutlet weak var tailAVet: UILabel!
    @IBOutlet weak var events: UILabel!
    @IBOutlet weak var vitalDocuments: UILabel!
    @IBOutlet weak var cuteDogContest: UILabel!
    @IBOutlet weak var beASponser: UILabel!
    
    var didTapMenuType: ((MenuType) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = .left
        self.view.addGestureRecognizer(swipeRight)
    }
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case .right: break
            case .down: break
            case .left:
                self.dismiss(animated: true, completion: nil)
            case .up: break
            default:
                break
            }
        }
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row) else { return }
        dismiss(animated: true) { [weak self] in
            self?.didTapMenuType?(menuType)
        }
    }
}
