//
//  File.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 18/12/20.
//

import UIKit
import DropDown

class SchedualEventsViewController: UIViewController {

    /*************  UIButton  ************************/
    @IBOutlet weak var bookAppointment: UIButton!
   // @IBOutlet weak var dateView: UITextField!
    //@IBOutlet weak var timePick: UITextField!

    /*************  Date Array  ************************/
    fileprivate var singleDate: Date = Date()
    fileprivate var multipleDates: [Date] = []
    
    /*************  UILabel  ************************/
    @IBOutlet weak var scheduleEventsTitle: UILabel!
    @IBOutlet weak var navigationText: UILabel!
    @IBOutlet weak var medicalAwareness: UIButton!
    @IBOutlet weak var eommunityPrograme: UIButton!
    @IBOutlet weak var scheduleEvents: UIButton!
    
    /*************  TextField  ************************/
    @IBOutlet weak var eventsName: UITextField!
    @IBOutlet weak var locationText: UITextField!
   // @IBOutlet weak var datetext: UITextField!
   // @IBOutlet weak var timetext: UITextField!
    @IBOutlet weak var bookAppointents: UIButton!
    
    @IBOutlet weak var selectCommunity: UIView!
    @IBOutlet weak var selectCommunityLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    var data = [SelectTime]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bookAppointment.layer.cornerRadius = bookAppointment.layer.frame.height/2
        
        data.append(SelectTime(id: "1", time: "10:00 AM"))
        data.append(SelectTime(id: "1", time: "12:00 AM"))
        data.append(SelectTime(id: "1", time: "02:00 PM"))
        data.append(SelectTime(id: "1", time: "04:00 PM"))
        data.append(SelectTime(id: "1", time: "05:00 PM"))
        data.append(SelectTime(id: "1", time: "07:00 PM"))
        
        self.bookAppointment.layer.cornerRadius = bookAppointment.layer.frame.height/2
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.touchTapped(_:)))
        self.selectCommunity.addGestureRecognizer(tap)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        self.collectionView.collectionViewLayout = flowLayout
        self.collectionView.showsHorizontalScrollIndicator = false
        
        //Comment if you set Datasource and delegate in .xib
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        //Register the xib for collection view cell
        self.collectionView.register(UINib(nibName: "TimeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TimeCollectionViewCell")
        
    }
    @objc func touchTapped(_ sender: UITapGestureRecognizer) {
        let dropDown = DropDown()
        dropDown.anchorView = self.selectCommunity
        dropDown.backgroundColor = .white
        dropDown.cornerRadius = 8
        dropDown.textFont = UIFont(name: "futura", size: 16)!
        dropDown.textColor = .gray
        dropDown.cellHeight = 50
        dropDown.separatorColor = .gray
        
        dropDown.arrowIndicationX =  .none
        dropDown.dataSource = ["Dog walking", "Pet Sitting", "Pet's Home", "Pet Adoption", "PetSmart Doggie"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            selectCommunityLabel.text = item
            selectCommunityLabel.textColor = .black
            dropDown.hide()
        }
        dropDown.width = 200
        dropDown.show()
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
}
extension SchedualEventsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TimeCollectionViewCell", for: indexPath) as! TimeCollectionViewCell
        cell.backView.layer.cornerRadius = cell.backView.layer.frame.height/2-2
        cell.timeLabel.text =  data[indexPath.row].time
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
extension SchedualEventsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.size.width/3.9), height: (view.frame.size.width/10.2))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
}
