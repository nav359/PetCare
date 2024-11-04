//
//  HomeViewControllerPO.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 21/12/20.
//

import UIKit

class HomeViewControllerPO: UIViewController {
    
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    @IBOutlet weak var categpryCollectionView: UICollectionView!
    @IBOutlet weak var pageView: UIPageControl!
    
    var timer = Timer()
    var counter = 0
    var topView: UIView?
    var HomeCategoryArray = [HomeCategory]()
    let transiton = SlideInTransition()
    let reuseIdentifier = "HomeCategoryCollectionViewCell"
    var imgArr = [UIImage(named:"homoimage"), UIImage(named:"homoimage"), UIImage(named:"homoimage")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSetup()
    }
    func initSetup() {
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
        self.tabBarController?.tabBar.tintColor = hexStringToUIColor(hex: "e7143b")
        self.tabBarController?.tabBar.layer.shadowColor = UIColor.black.cgColor
        self.tabBarController?.tabBar.layer.shadowOffset = CGSize(width: 0, height: -8.0)
        self.tabBarController?.tabBar.layer.shadowRadius = 10.0
        self.tabBarController?.tabBar.layer.shadowOpacity = 0.12
        self.tabBarController?.tabBar.layer.masksToBounds = false
        self.tabBarController?.tabBar.clipsToBounds = false
        
        self.sliderCollectionView.dataSource = self
        self.sliderCollectionView.delegate = self
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        self.categpryCollectionView.collectionViewLayout = flowLayout
        self.categpryCollectionView.showsHorizontalScrollIndicator = false
        
        //Comment if you set Datasource and delegate in .xib
        self.categpryCollectionView.dataSource = self
        self.categpryCollectionView.delegate = self
        
        //Register the xib for collection view cell
        self.categpryCollectionView.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
        HomeCategoryArray.append(HomeCategory(id: "1", imageName: "ic_dna_red", title: "Dog DNA Identification Test"))
        HomeCategoryArray.append(HomeCategory(id: "1", imageName: "ic_pet_red", title: "Pet Wellness Plan"))
        HomeCategoryArray.append(HomeCategory(id: "1", imageName: "ic_pet_concierge_red", title: "Pet Concierge"))
        HomeCategoryArray.append(HomeCategory(id: "1", imageName: "ic_qr_red", title: "QR Code Tracking"))
        HomeCategoryArray.append(HomeCategory(id: "1", imageName: "ic_qr_red", title: "Pet Lost OR Found"))
        HomeCategoryArray.append(HomeCategory(id: "1", imageName: "ic_persons_red", title: "TailAvct"))
        HomeCategoryArray.append(HomeCategory(id: "1", imageName: "ic_document_red", title: "Vital Documents"))
        HomeCategoryArray.append(HomeCategory(id: "1", imageName: "ic_contest", title: "Cute Dog Contest"))
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
    }
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case .right:
                presentSideMenu()
            case .down: break
            case .left: break
            case .up: break
            default: break
            }
        }
    }
    @IBAction func profileButton(_ sender: Any) {
        let vc = UIStoryboard.init(name: _storyboard_PO, bundle: nil).instantiateViewController(withIdentifier: _vc_EditProfileVC) as? EditProfileViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    @IBAction func notificationButton(_ sender: Any) {
        let vc = UIStoryboard.init(name: _storyboard_main, bundle: nil).instantiateViewController(withIdentifier: _vc_NotificationVC) as? NotificationViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    @IBAction func shopButtonClicked(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: _storyboard_PO, bundle: nil).instantiateViewController(withIdentifier: _vc_BuyProductsVC) as? BuyProductsViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func viewDidDisappear(_ animated: Bool) {
        self.dismiss(animated: false, completion: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.dismiss(animated: false, completion: nil)
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
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        categpryCollectionView?.collectionViewLayout.invalidateLayout();
    }
    @IBAction func menuButtonPressed(_ sender: UIButton) {
        presentSideMenu()
    }
    func presentSideMenu() {
        let storyboard = UIStoryboard.init(name: _storyboard_PO, bundle: nil)
        let menuViewController = storyboard.instantiateViewController(withIdentifier: _vc_MenuVCPO) as! MenuViewControllerPO
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
}
extension HomeViewControllerPO: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.sliderCollectionView {
            return imgArr.count
        } else {
            return HomeCategoryArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.sliderCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            if let vc = cell.viewWithTag(111) as? UIImageView {
                vc.image = imgArr[indexPath.row]
            }
            return cell
        } else if collectionView == self.categpryCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! HomeCategoryCollectionViewCell
            cell.categoryImage.image = UIImage(named: HomeCategoryArray[indexPath.row].imageName)
            cell.categoryName.text = HomeCategoryArray[indexPath.row].title
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.categpryCollectionView {
            switch indexPath.row {
            case 0:
                let vc = UIStoryboard.init(name: _storyboard_PO, bundle: Bundle.main).instantiateViewController(identifier: _vc_IDDogDNAVC) as? IDDogDNAViewController
                self.navigationController?.pushViewController(vc!, animated: true)
            case 1:
                let vc = UIStoryboard.init(name: _storyboard_PO, bundle: Bundle.main).instantiateViewController(identifier: _vc_PetWellnessVC) as? PetWellnessViewController
                self.navigationController?.pushViewController(vc!, animated: true)
            case 2:
                let vc = UIStoryboard.init(name: _storyboard_PO, bundle: Bundle.main).instantiateViewController(identifier: _vc_PetConciergeVCPO) as? PetConciergeViewControllerPO
                self.navigationController?.pushViewController(vc!, animated: true)
            case 3:
                let vc = UIStoryboard.init(name: _storyboard_PO, bundle: Bundle.main).instantiateViewController(identifier: _vc_QRCodeVCPO) as? QRCodeReaderViewControllerPO
                self.navigationController?.pushViewController(vc!, animated: true)
            case 4:
                let vc = UIStoryboard.init(name: _storyboard_PO, bundle: Bundle.main).instantiateViewController(identifier: _vc_PetLostORFoundVCPO) as? PetLostORFoundViewControllerPO
                self.navigationController?.pushViewController(vc!, animated: true)
            case 5:
                let vc = UIStoryboard.init(name: _storyboard_PO, bundle: Bundle.main).instantiateViewController(identifier: _vc_TailVetVC) as? TailVetViewControllerPO
                self.navigationController?.pushViewController(vc!, animated: true)
            case 6:
                let vc = UIStoryboard.init(name: _storyboard_PO, bundle: Bundle.main).instantiateViewController(identifier: _vc_VitalDocumentsVCPO) as? VitalDocumentsViewControllerPO
                self.navigationController?.pushViewController(vc!, animated: true)
            case 7:
                let vc = UIStoryboard.init(name: _storyboard_PO, bundle: Bundle.main).instantiateViewController(identifier: _vc_PetContestVCPO) as? PetContestViewControllerPO
                self.navigationController?.pushViewController(vc!, animated: true)
            default:
                break
            }
        }
    }
}
extension HomeViewControllerPO: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == self.sliderCollectionView {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        } else {
            return UIEdgeInsets(top: 10, left: 20, bottom: 0, right: 20)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.sliderCollectionView {
            let size = sliderCollectionView.frame.size
            return CGSize(width: size.width, height: size.height)
        } else {
            return CGSize(width: (view.frame.size.width/2.4), height: (view.frame.size.width/2.4))
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == self.sliderCollectionView {
            return 0.0
        } else {
            return 10.0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == self.sliderCollectionView {
            return 0.0
        } else {
            return 10.0
        }
    }
}
extension HomeViewControllerPO: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = true
        return transiton
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = false
        return transiton
    }
    func transitionToNew(_ menuType: MenuTypePO) {
        topView?.removeFromSuperview()
        switch menuType {
        case .DogDNA:
            let vc = UIStoryboard.init(name: _storyboard_PO, bundle: Bundle.main).instantiateViewController(identifier: _vc_PetDetailsVC) as? PetDetailsViewController
            self.navigationController?.pushViewController(vc!, animated: true)
        case .PetWellness:
            let vc = UIStoryboard.init(name: _storyboard_PO, bundle: Bundle.main).instantiateViewController(identifier: _vc_PetWellnessVC) as? PetWellnessViewController
            self.navigationController?.pushViewController(vc!, animated: true)
        case .PetConcierge:
            let vc = UIStoryboard.init(name: _storyboard_PO, bundle: Bundle.main).instantiateViewController(identifier: _vc_PetConciergeVCPO) as? PetConciergeViewControllerPO
            self.navigationController?.pushViewController(vc!, animated: true)
        case .QRCodeTraking:
            let vc = UIStoryboard.init(name: _storyboard_PO, bundle: nil).instantiateViewController(identifier: _vc_QRCodeVCPO) as? QRCodeReaderViewControllerPO
            self.navigationController?.pushViewController(vc!, animated: true)
        case .TailAvet:
            let vc = UIStoryboard.init(name: _storyboard_PO, bundle: Bundle.main).instantiateViewController(identifier: _vc_TailVetVC) as? TailVetViewControllerPO
            self.navigationController?.pushViewController(vc!, animated: true)
        case .VitalDocuments:
            let vc = UIStoryboard.init(name: _storyboard_PO, bundle: Bundle.main).instantiateViewController(identifier: _vc_VitalDocumentsVCPO) as? VitalDocumentsViewControllerPO
            self.navigationController?.pushViewController(vc!, animated: true)
        case .Blog:
            let vc = UIStoryboard.init(name: _storyboard_PO, bundle: Bundle.main).instantiateViewController(identifier: _vc_BlogsVC) as? BlogViewController
            self.navigationController?.pushViewController(vc!, animated: true)
        case .VetnaireyEvent:
            let vc = UIStoryboard.init(name: _storyboard_PO, bundle: Bundle.main).instantiateViewController(identifier: _vc_VeterniaryEventVC) as? VeterniaryEventViewController
            self.navigationController?.pushViewController(vc!, animated: true)
        case .WwllnessProgram:
            break
        case .PetDetails:
            let vc = UIStoryboard.init(name: _storyboard_PO, bundle: Bundle.main).instantiateViewController(identifier: _vc_PetDetailsVC) as? PetDetailsViewController
            self.navigationController?.pushViewController(vc!, animated: true)
        case .TestResults: break
        case .DNATest: break
        case .OrderDNA:
            let vc = UIStoryboard.init(name: _storyboard_PO, bundle: Bundle.main).instantiateViewController(identifier: _vc_IDDogDNAVC) as? IDDogDNAViewController
            self.navigationController?.pushViewController(vc!, animated: true)
        case .Appointments:
            let vc = UIStoryboard.init(name: _storyboard_PO, bundle: Bundle.main).instantiateViewController(identifier: _vc_AppointmentVCPO) as? AppointmentViewControllerPO
            self.navigationController?.pushViewController(vc!, animated: true)
        case .PetContest:
            let vc = UIStoryboard.init(name: _storyboard_PO, bundle: Bundle.main).instantiateViewController(identifier: _vc_PetContestVCPO) as? PetContestViewControllerPO
            self.navigationController?.pushViewController(vc!, animated: true)
        case .BeASponser:
            let vc = UIStoryboard.init(name: _storyboard_PO, bundle: Bundle.main).instantiateViewController(identifier: _vc_BeASponserVC) as? BeASponserViewControllerPO
            self.navigationController?.pushViewController(vc!, animated: true)
        case .Shop:
            let vc = UIStoryboard.init(name: _storyboard_PO, bundle: Bundle.main).instantiateViewController(identifier: _vc_BuyProductsVC) as? BuyProductsViewController
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
}
