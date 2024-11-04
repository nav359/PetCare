//
//  File.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 18/12/20.
//

import Foundation
import UIKit

class MedicalAwarenessProgramViewController: UIViewController {
    
    /*************  UICollectionView  ************************/
    @IBOutlet weak var collectionView: UICollectionView!
    let reuseIdentifier = "MedicalAwarenessCollectionViewCell"
    
    /*************  data array  ************************/
    var MedicalAwarenessArray = [MedicalAwareness]()
    
    /*************  UILabel  ************************/
    @IBOutlet weak var medicalAwarenessTitle: UILabel!
    @IBOutlet weak var navigationText: UILabel!
   
    /*************  UIButton  ************************/
    @IBOutlet weak var scheduleEvents: UIButton!
    @IBOutlet weak var communityProgrames: UIButton!
    @IBOutlet weak var medicalAwareness: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MedicalAwarenessArray.append(MedicalAwareness(id: "1", image: "medical-1", title: "Veterinary Services"))
        MedicalAwarenessArray.append(MedicalAwareness(id: "1", image: "medical-2", title: "Small Pets Care"))
        MedicalAwarenessArray.append(MedicalAwareness(id: "1", image: "medical-3", title: "Vaccines"))
        MedicalAwarenessArray.append(MedicalAwareness(id: "1", image: "s", title: "Dental Treatments"))
        MedicalAwarenessArray.append(MedicalAwareness(id: "1", image: "medical-2", title: "Physiotherapy"))
        MedicalAwarenessArray.append(MedicalAwareness(id: "1", image: "medical-1", title: "Veterinary Services "))
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let sizeCollection = CGSize(width: (view.frame.size.width/2.2), height: (view.frame.size.width/1.9))
        flowLayout.itemSize = sizeCollection
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 15
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        self.collectionView.collectionViewLayout = flowLayout
        self.collectionView.showsHorizontalScrollIndicator = false
        
        //Comment if you set Datasource and delegate in .xib
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        //Register the xib for collection view cell
       
        self.collectionView.register(UINib(nibName: reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    @IBAction func schedulButtonPressed(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: _storyboard_main, bundle: Bundle.main).instantiateViewController(identifier: _vc_SchedualTestVC) as? SchedualTestViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func cummunityButtonPressed(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: _storyboard_main, bundle: Bundle.main).instantiateViewController(identifier: _vc_CommunityPrograVC) as? CommunityProgramViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func medicalAwareness(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: _storyboard_main, bundle: Bundle.main).instantiateViewController(identifier: _vc_MedicalAwarenessVC) as? MedicalAwarenessProgramViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView?.collectionViewLayout.invalidateLayout();
    }
}
extension MedicalAwarenessProgramViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        MedicalAwarenessArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MedicalAwarenessCollectionViewCell
        cell.mainImage.image =  UIImage(named: MedicalAwarenessArray[indexPath.row].image)
        cell.mainTitle.text = MedicalAwarenessArray[indexPath.row].title
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
