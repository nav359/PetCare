//
//  File.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 18/12/20.
//

import Foundation
import UIKit

class CommunityProgramViewController: UIViewController {

    /*************  UILabel  ************************/
    @IBOutlet weak var navigationText: UILabel!
    @IBOutlet weak var communityProgramesText: UILabel!
    
    /*************  UIButton  ************************/
    @IBOutlet weak var scheduleEvents: UIButton!
    @IBOutlet weak var communityProgrames: UIButton!
    @IBOutlet weak var medicalAwareness: UIButton!
    
    /*************  UICollectionView  ************************/
    @IBOutlet weak var collectionView: UICollectionView!
    let margin: CGFloat = 10
    let reuseIdentifier = "CummunityPrgmViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let sizeCollection = CGSize(width: (view.frame.size.width/2.2), height: (view.frame.size.width/1.9)+20)
        flowLayout.itemSize = sizeCollection
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 15
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        self.collectionView.collectionViewLayout = flowLayout
        self.collectionView.showsHorizontalScrollIndicator = false
        
        //Comment if you set Datasource and delegate in .xib
        self.collectionView.dataSource = self
        self.collectionView.delegate = self

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
extension CommunityProgramViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CummunityPrgmViewCell
        cell.backView.layer.cornerRadius = 10
        cell.backView.layer.shadowColor = UIColor.gray.cgColor
        cell.backView.layer.shadowOffset = CGSize.zero
        cell.backView.layer.shadowOpacity = 1.0
        cell.backView.layer.shadowRadius = 7.0
        cell.backView.layer.masksToBounds =  false
        
        //cell.contentView.backgroundColor = GradientColor(.leftToRight, frame: view.frame, colors: self.cellRandomBackgroundColors())
        cell.contentView.layer.cornerRadius = 12.0
        cell.contentView.layer.masksToBounds = true
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1)
        cell.layer.shadowOpacity = 0.2
        cell.layer.shadowRadius = 1.0
        cell.layer.masksToBounds = false
        cell.layer.cornerRadius = 3
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let noOfCellsInRow = 2
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left + flowLayout.sectionInset.right + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        return CGSize(width: size, height: size)
    }
}
