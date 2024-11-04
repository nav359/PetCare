//
//  HomeViewControllerSP.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 28/12/20.
//

import UIKit

class HomeViewControllerSP: UIViewController {
    
    /*************  UICollectionView  ************************/
    @IBOutlet weak var collectionView: UICollectionView!
    let reuseIdentifier = "HomeServicesCollectionViewCell"
    
    /*************  UILabel  ************************/
    @IBOutlet weak var ourServicesText: UILabel!
    
    /*************  UITextField  ************************/
    @IBOutlet weak var searchTextField: UITextField!
    
    /*************  Data Array  ************************/
    var data = [HomeServices]()
    
    let transiton = SlideInTransition()
    
    var topView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSetup()

    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView?.collectionViewLayout.invalidateLayout();
    }
    @IBAction func notificationButton(_ sender: UIButton) {
        
    }
    @IBAction func menuButtonTapped() {
        presentSideMenu()
    }
    func presentSideMenu() {
        let storyboard = UIStoryboard.init(name: _storyboard_SP, bundle: nil)
        let menuViewController = storyboard.instantiateViewController(withIdentifier: _vc_MenuVCSP) as! MenuViewControllerSP
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
    func initSetup() {
        ourServicesText.textColor = hexStringToUIColor(hex: "010000")
        //ourServicesText.font = getFont(fontName: "futuraMario500", fontSize: 17)
        searchTextField.textColor = hexStringToUIColor(hex: "ada5a5")
        //searchTextField.font = getFont(fontName: "futuraMario500", fontSize: 17)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        self.collectionView.collectionViewLayout = flowLayout
        self.collectionView.showsHorizontalScrollIndicator = false
        
        //Comment if you set Datasource and delegate in .xib
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.collectionView.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
        // Do any additional setup after loading the view.
        data.append(HomeServices(id: "", imageName: "Dog Grooming", title: "Dog Grooming"))
        data.append(HomeServices(id: "", imageName: "Veterinarian", title: "Veterinarian"))
        data.append(HomeServices(id: "", imageName: "Dog Walking & Boarding", title: "Dog Walking & Boarding"))
        data.append(HomeServices(id: "", imageName: "Dog Day Care", title: "Dog Day Care"))
        data.append(HomeServices(id: "", imageName: "Pet Pharmacy", title: "Pet Pharmacy"))
        data.append(HomeServices(id: "", imageName: "Pet Wellness System", title: "Pet Wellness System"))
        data.append(HomeServices(id: "", imageName: "Pet DNA Services", title: "Pet DNA Services"))
        data.append(HomeServices(id: "", imageName: "Pet Waste Testing", title: "Pet Waste Testing"))
        
        //Tab bar configuration
        tabBarController?.tabBar.tintColor = hexStringToUIColor(hex: "e7143b")
        self.tabBarController?.tabBar.tintColor = hexStringToUIColor(hex: "e7143b")
        self.tabBarController?.tabBar.layer.shadowColor = UIColor.black.cgColor
        self.tabBarController?.tabBar.layer.shadowOffset = CGSize(width: 0, height: -8.0)
        self.tabBarController?.tabBar.layer.shadowRadius = 10.0
        self.tabBarController?.tabBar.layer.shadowOpacity = 0.12
        self.tabBarController?.tabBar.layer.masksToBounds = false
        self.tabBarController?.tabBar.clipsToBounds = false
        
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
}
extension HomeViewControllerSP: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! HomeServicesCollectionViewCell
        cell.imageName.image = UIImage(named: data[indexPath.row].imageName)
        cell.nameLabel.text = data[indexPath.row].title
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            break
        case 1:
            break
        case 2:
            break
        case 3:
            break
        case 4:
            break
        case 5:
            break
        case 6:
            break
        case 7:
            break
        default:
            break
        }
    }
}
extension HomeViewControllerSP: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let scaleFactor = (screenWidth / 3) - 20
        
        return CGSize(width: scaleFactor, height: scaleFactor+35)
    }
    func transitionToNew(_ menuType: MenuTypeSP) {
        topView?.removeFromSuperview()
        switch menuType {
        case .Clients:
            let vc = UIStoryboard.init(name: _storyboard_SP, bundle: Bundle.main).instantiateViewController(identifier: _vc_ClientListVCSP) as? ClientListViewControllerSP
            self.navigationController?.pushViewController(vc!, animated: true)
        case .Appointments: //AppointmentsViewControllerSP
            let vc = UIStoryboard.init(name: _storyboard_SP, bundle: Bundle.main).instantiateViewController(identifier: _vc_AppointmentsVCSP) as? AppointmentsViewControllerSP
            self.navigationController?.pushViewController(vc!, animated: true)
        case .Events:
            let vc = UIStoryboard.init(name: _storyboard_SP, bundle: Bundle.main).instantiateViewController(identifier: _vc_EsventsVCSP) as? EventsViewControllerSP
            self.navigationController?.pushViewController(vc!, animated: true)
        case .TailAvet: //TailVetViewControllerSP
            let vc = UIStoryboard.init(name: _storyboard_SP, bundle: Bundle.main).instantiateViewController(identifier: _vc_TailVetVCSP) as? TailVetViewControllerSP
            self.navigationController?.pushViewController(vc!, animated: true)
        case .vitalDocs:
            let vc = UIStoryboard.init(name: _storyboard_SP, bundle: Bundle.main).instantiateViewController(identifier: _vc_VitalDocumentsVCSP) as? VitalDocumentsViewControllerSP
            self.navigationController?.pushViewController(vc!, animated: true)
        case .BeASponser:
            let vc = UIStoryboard.init(name: _storyboard_SP, bundle: Bundle.main).instantiateViewController(identifier: _vc_BeASponserVCSP) as? BeASponserViewControllerSP
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
extension HomeViewControllerSP: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = true
        return transiton
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = false
        return transiton
    }
}
