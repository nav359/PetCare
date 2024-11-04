//
//  HomeViewController.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 14/12/20.
//

import UIKit

class HomeViewController: UIViewController {
    
    /*************  UIView  ************************/
    @IBOutlet weak var searchView: UIView!
    @IBOutlet var tableViewHeader: UIView!
    @IBOutlet weak var idView: UIView!
    @IBOutlet weak var petNameView: UIView!
    @IBOutlet weak var moveInDateView: UIView!
    @IBOutlet weak var location: UIView!
    @IBOutlet weak var status: UIView!
    @IBOutlet weak var inventoryView: UIView!
    @IBOutlet weak var inevntoryTopView: UIView!
    @IBOutlet weak var comingJoinView: UIView!
    
    /*************  UILabel  ************************/
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var petName: UILabel!
    @IBOutlet weak var MoveinDate: UILabel!
    @IBOutlet weak var locationText: UILabel!
    @IBOutlet weak var statusText: UILabel!
    
    /*************  UITextField  ************************/
    @IBOutlet weak var searchTextField: UITextField!
    
    /*************  UICollectionView  ************************/
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    
    /*************  tableView  ************************/
    @IBOutlet weak var tableView: UITableView!
    
    /*************  pageView  ************************/
    @IBOutlet weak var pageView: UIPageControl!

    /*************  UIButton  ************************/
    @IBOutlet weak var viewAllButton: UIButton!
    
    /*************  UIImageView  ************************/
    @IBOutlet weak var comingSoonImage: UIImageView!
    
    /*************  scrollView  ************************/
    @IBOutlet weak var scrollView: UIScrollView!
    
    /*************  NSLayoutConstraint  ************************/
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    
    var driverid: String? = ""
    var dataArray: [DataModel] = [DataModel]()
    
    let transiton = SlideInTransition()
    var topView: UIView?
    var timer = Timer()
    var counter = 0
    let reuseIdentifier = "DataTableViewCell"
    var imgArr = [UIImage(named:"7"), UIImage(named:"cat"), UIImage(named:"7"), UIImage(named:"cat")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchView.layer.cornerRadius = searchView.layer.frame.height/2
        viewAllButton.backgroundColor = .clear
        viewAllButton.layer.cornerRadius = viewAllButton.layer.frame.height/2
        viewAllButton.layer.borderWidth = 1
        viewAllButton.layer.borderColor = UIColor.black.cgColor
        comingJoinView.layer.cornerRadius = 10
        comingJoinView.layer.masksToBounds = true
        comingSoonImage.layer.masksToBounds = false
        tableViewHeader.layer.cornerRadius = 6
        tableViewHeader.layer.masksToBounds = false
        view.backgroundColor = .white
        tabBarController?.tabBar.tintColor = hexStringToUIColor(hex: "e7143b")
        self.tabBarController?.tabBar.tintColor = hexStringToUIColor(hex: "e7143b")
        self.tabBarController?.tabBar.layer.shadowColor = UIColor.black.cgColor
        self.tabBarController?.tabBar.layer.shadowOffset = CGSize(width: 0, height: -8.0)
        self.tabBarController?.tabBar.layer.shadowRadius = 10.0
        self.tabBarController?.tabBar.layer.shadowOpacity = 0.12
        self.tabBarController?.tabBar.layer.masksToBounds = false
        self.tabBarController?.tabBar.clipsToBounds = false
        
        pageView.numberOfPages = imgArr.count
        pageView.currentPage = 0
        
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
        searchTextField.attributedPlaceholder = NSAttributedString(string: "Search", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        self.tableView.separatorStyle = .none
        // Do any additional setup after loading the view.
        idView.addViewBorder(borderColor: #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1), borderWith: 0.0, borderCornerRadius: 0)
        petNameView.addViewBorder(borderColor: #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1), borderWith: 0.3, borderCornerRadius: 0)
        moveInDateView.addViewBorder(borderColor: #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1), borderWith: 0.3, borderCornerRadius: 0)
        location.addViewBorder(borderColor: #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1), borderWith: 0.3, borderCornerRadius: 0)
        status.addViewBorder(borderColor: #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1), borderWith: 0.0, borderCornerRadius: 0)
        //viewAllButton.addViewBorder(borderColor: #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1), borderWith: 1.0, borderCornerRadius: 0)
        
        self.tableView.backgroundColor = .white
        inventoryView.layer.backgroundColor = UIColor.white.cgColor
        inventoryView.backgroundColor = .white
        inventoryView.layer.shadowOffset = CGSize(width: 0, height: -8)
        inventoryView.layer.shadowColor = UIColor.lightGray.cgColor
        inventoryView.layer.shadowOpacity = 0.12
        inventoryView.layer.shadowRadius = 10.0
        inventoryView.layer.masksToBounds = true
        inventoryView.layer.cornerRadius = 10
        
        dataArray.append(DataModel(id: "201631", petName: "Charlie", moveInDate: "20/08/20", location: "New York City", Status: "TExt"))
        dataArray.append(DataModel(id: "201631", petName: "Charlie", moveInDate: "20/08/20", location: "California", Status: "TExt"))
        dataArray.append(DataModel(id: "201631", petName: "Charlie", moveInDate: "20/08/20", location: "Michinghan", Status: "TExt"))
        dataArray.append(DataModel(id: "201631", petName: "Charlie", moveInDate: "20/08/20", location: "Dallas, Texas", Status: "TExt"))
        dataArray.append(DataModel(id: "201631s", petName: "Charlie", moveInDate: "20/08/20", location: "Dallas, Texas", Status: "TExt"))
        
        let contentRect: CGRect = scrollView.subviews.reduce(into: .zero) { rect, view in
            rect = rect.union(view.frame)
        }
        scrollView.contentSize = contentRect.size
        
        NotificationCenter.default.addObserver(self, selector: #selector(showProfile), name: NSNotification.Name("ShowProfile"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showSettings), name: NSNotification.Name("ShowSettings"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showSignIn), name: NSNotification.Name("ShowSignIn"), object: nil)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
    }
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case .right:
                presentSideMenu()
            case .down:
                print("Swiped down")
            case .left:
                print("Swiped left")
            case .up:
                print("Swiped up")
            default:
                break
            }
        }
    }
    @objc func showProfile() {
        performSegue(withIdentifier: "ShowProfile", sender: nil)
    }
    
    @objc func showSettings() {
        performSegue(withIdentifier: "ShowSettings", sender: nil)
    }
    
    @objc func showSignIn() {
        performSegue(withIdentifier: "ShowSignIn", sender: nil)
    }
    @IBAction func menuButtonTapped() {
        presentSideMenu()
    }
    func presentSideMenu() {
        let storyboard = UIStoryboard.init(name: _storyboard_main, bundle: nil)
        let menuViewController = storyboard.instantiateViewController(withIdentifier: _vc_MenuViewVC) as! MenuViewController
        menuViewController.didTapMenuType = { menuType in
            self.transitionToNew(menuType)
        }
        menuViewController.providesPresentationContextTransitionStyle = true
        menuViewController.definesPresentationContext = true
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        self.present(menuViewController, animated: true) {
            menuViewController.view.superview?.isUserInteractionEnabled = true
            menuViewController.view.superview?.subviews[0].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.alertControllerBackgroundTapped)))
        }
    }
    @objc func alertControllerBackgroundTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    @objc func changeImage() {
         if counter < imgArr.count {
             let index = IndexPath.init(item: counter, section: 0)
             self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
             pageView.currentPage = counter
             counter += 1
         } else {
             counter = 0
             let index = IndexPath.init(item: counter, section: 0)
             self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
             pageView.currentPage = counter
             counter = 1
         }
     }
    func transitionToNew(_ menuType: MenuType) {
        topView?.removeFromSuperview()
        switch menuType {
        case .addPet:
            let vc = UIStoryboard.init(name: _storyboard_main, bundle: Bundle.main).instantiateViewController(identifier: _vc_AddPetDeatailsVC) as? AddPetDeatailsViewController
            self.navigationController?.pushViewController(vc!, animated: true)
        case .clients:
            let vc = UIStoryboard.init(name: _storyboard_main, bundle: Bundle.main).instantiateViewController(identifier: _vc_ClientListVC) as? ClientListViewController
            self.navigationController?.pushViewController(vc!, animated: true)
        case .lostAndFound:
            let vc = UIStoryboard.init(name: _storyboard_main, bundle: Bundle.main).instantiateViewController(identifier: _vc_LostAndFoundVC) as? LostAndFoundViewController
            self.navigationController?.pushViewController(vc!, animated: true)
        case .appointments:
            let vc = UIStoryboard.init(name: _storyboard_main, bundle: Bundle.main).instantiateViewController(identifier: _vc_AppointmentVC) as? AppointmentViewController
            vc?.checkNavbar = true
            self.navigationController?.pushViewController(vc!, animated: true)
        case .vaccation:
            let vc = UIStoryboard.init(name: _storyboard_main, bundle: Bundle.main).instantiateViewController(identifier: _vc_VaccinationVC) as? VaccinationViewController
            self.navigationController?.pushViewController(vc!, animated: true)
        case .maps:
            break
//            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: _vc_MapVC) as? MapViewController
//            self.navigationController?.pushViewController(vc!, animated: true)
        case .tailAvet:
            let vc = UIStoryboard.init(name: _storyboard_main, bundle: Bundle.main).instantiateViewController(identifier: _vc_TailVetVCPM) as? TailVetViewController
            self.navigationController?.pushViewController(vc!, animated: true)
        case .events:
            let vc = UIStoryboard.init(name: _storyboard_main, bundle: Bundle.main).instantiateViewController(identifier: _vc_EventsVC) as? EventsViewController
            self.navigationController?.pushViewController(vc!, animated: true)
        case .vitalDocuments:
            let vc = UIStoryboard.init(name: _storyboard_main, bundle: Bundle.main).instantiateViewController(identifier: _vc_VitalDocumentsVC) as? VitalDocumentsViewController
            self.navigationController?.pushViewController(vc!, animated: true)
        case .cuteDog:
            let vc = UIStoryboard.init(name: _storyboard_main, bundle: Bundle.main).instantiateViewController(identifier: _vc_PetContestVC) as? PetContestViewController
            self.navigationController?.pushViewController(vc!, animated: true) //PetContestViewController
        case .beASponser:
            let vc = UIStoryboard.init(name: _storyboard_main, bundle: Bundle.main).instantiateViewController(identifier: "BeASponserViewController") as? BeASponserViewController
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        if let vc = cell.viewWithTag(111) as? UIImageView {
            vc.image = imgArr[indexPath.row]
        }
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = sliderCollectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! DataTableViewCell
        cell.backView.layer.shadowOffset = CGSize(width: 0, height: 1)
        cell.backView.layer.shadowColor = UIColor.lightGray.cgColor
        cell.backView.layer.shadowOpacity = 1
        cell.backView.layer.shadowRadius = 5
        cell.backView.layer.masksToBounds = false
        cell.backView.layer.cornerRadius = 5
        cell.idLabel.text =  dataArray[indexPath.row].id
        cell.petNameLabel.text =  dataArray[indexPath.row].petName
        cell.moveInDateLabel.text =  dataArray[indexPath.row].moveInDate
        cell.locationlabel.text =  dataArray[indexPath.row].location
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
}
extension HomeViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = true
        return transiton
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = false
        return transiton
    }
}
extension UIView {
    public func addViewBorder(borderColor:CGColor,borderWith:CGFloat,borderCornerRadius:CGFloat){
        self.layer.borderWidth = borderWith
        self.layer.borderColor = borderColor
        self.layer.cornerRadius = borderCornerRadius

    }
}
struct DataModel {
    let id: String
    let petName: String
    let moveInDate: String
    let location: String
    let Status: String
}
extension UITableViewCell {
  func separator(hide: Bool) {
    separatorInset.left = hide ? bounds.size.width : 0
  }
}
