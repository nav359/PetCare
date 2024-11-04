//
//  MenuViewControllerPO.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 21/12/20.
//
import UIKit

enum MenuTypePO: Int {
    case DogDNA
    case PetWellness
    case PetConcierge
    case QRCodeTraking
    case TailAvet
    case VitalDocuments
    case Blog
    case VetnaireyEvent
    case WwllnessProgram
    case PetDetails
    case TestResults
    case DNATest
    case OrderDNA
    case Appointments
    case PetContest
    case BeASponser
    case Shop
}
class MenuViewControllerPO: UITableViewController {
    
    var didTapMenuType: ((MenuTypePO) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = .left
        self.view.addGestureRecognizer(swipeRight)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
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
    override func viewDidDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        self.dismiss(animated: false, completion: nil)
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuTypePO(rawValue: indexPath.row) else { return }
        dismiss(animated: true) { [weak self] in
            self?.didTapMenuType?(menuType)
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
