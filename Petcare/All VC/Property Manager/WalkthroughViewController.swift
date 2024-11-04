//
//  OnBoardingViewController.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 07/12/20.
//

import UIKit

class WalkthroughViewController: UIViewController, WalkthroughPageViewControllerDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet var pageControl: UIPageControl!
    
    @IBOutlet var nextButton: UIButton! {
        didSet {
            nextButton.layer.cornerRadius = 25.0
            nextButton.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var letGetStartButton: UIButton!
    @IBOutlet var skipButton: UIButton!
    
    // MARK: - Properties
    
    var walkthroughPageViewController: WalkthroughPageViewController?
    
    // MARK: - Actions
    
    @IBAction func skipButtonTapped(sender: UIButton) {
        UserDefaults.standard.set(true, forKey: "hasViewedWalkthrough")
        //dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextButtonTapped(sender: UIButton) {
        if let index = walkthroughPageViewController?.currentIndex {
            switch index {
            case 0...1:
                walkthroughPageViewController?.forwardPage()
                
            case 2:
                UserDefaults.standard.set(true, forKey: "hasViewedWalkthrough")
                dismiss(animated: true, completion: nil)
                
            default: break
            }
        }
        
        updateUI()
    }
    
    @IBAction func SkipButtonPressed(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: _storyboard_main, bundle: Bundle.main).instantiateViewController(withIdentifier: _vc_UserTypeVC) as? UserTypeViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func updateUI() {
        if let index = walkthroughPageViewController?.currentIndex {
            switch index {
            case 0...1:
                nextButton.setTitle("Next", for: .normal)
                skipButton.isHidden = false
                
                pageControl.isHidden = false
                skipButton.isHidden = false
                nextButton.isHidden = false
                letGetStartButton.isHidden = true
            case 2:
                pageControl.isHidden = true
                skipButton.isHidden = true
                nextButton.isHidden = true
                letGetStartButton.isHidden = false
            default: break
            }
            pageControl.currentPage = index
        }
    }
    
    @IBAction func letGetStartedPressed(_ sender: UIButton) {
        buttonClicked()
    }
    @objc func buttonClicked() {
        let vc = UIStoryboard.init(name: _storyboard_main, bundle: Bundle.main).instantiateViewController(withIdentifier: _vc_UserTypeVC) as? UserTypeViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func didUpdatePageIndex(currentIndex: Int) {
        updateUI()
    }
    
    // MARK: - View controller life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pageControl.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if let pageViewController = destination as? WalkthroughPageViewController {
            walkthroughPageViewController = pageViewController
            walkthroughPageViewController?.walkthroughDelegate = self
        }
    }
    
}
