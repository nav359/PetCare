//
//  MenuViewControllerSP.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 28/12/20.
//

import UIKit

enum MenuTypeSP: Int {
    case Clients
    case Appointments
    case Events
    case TailAvet
    case vitalDocs
    case BeASponser
}
class MenuViewControllerSP: UITableViewController {
    
    /*************  TextField  ************************/
    @IBOutlet weak var clients: UILabel!
    @IBOutlet weak var appointments: UILabel!
    @IBOutlet weak var events: UILabel!
    @IBOutlet weak var tailAVait: UILabel!
    @IBOutlet weak var vitalRecords: UILabel!
    @IBOutlet weak var beASponser: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    
    /*************  Side Menu  ************************/
    var didTapMenuType: ((MenuTypeSP) -> Void)?
    
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
    func initSetup() {
        let color = hexStringToUIColor(hex: "202020")
        clients.textColor = color
        //clients.font = getFont(fontName: "futuraMario500", fontSize: 15)
        appointments.textColor = color
        //appointments.font = getFont(fontName: "futuraMario500", fontSize: 15)
        appointments.textColor = color
        //appointments.font = getFont(fontName: "futuraMario500", fontSize: 15)
        events.textColor = color
        //events.font = getFont(fontName: "futuraMario500", fontSize: 15)
        tailAVait.textColor = color
        //tailAVait.font = getFont(fontName: "futuraMario500", fontSize: 15)
        vitalRecords.textColor = color
        //vitalRecords.font = getFont(fontName: "futuraMario500", fontSize: 15)
        beASponser.textColor = color
        //beASponser.font = getFont(fontName: "futuraMario500", fontSize: 15)
        userName.textColor = .white
        //userName.font = getFont(fontName: "futuraMario500", fontSize: 16)
        userEmail.textColor = .white
        //userEmail.font = getFont(fontName: "futuraMario500", fontSize: 12)
    }
    override func viewDidDisappear(_ animated: Bool) {
        self.dismiss(animated: false, completion: nil)
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addPetButton(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: _vc_PetConciergeVCSP) as! PetConciergeProfileViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuTypeSP(rawValue: indexPath.row) else { return }
        dismiss(animated: true) { [weak self] in
            self?.didTapMenuType?(menuType)
        }
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
