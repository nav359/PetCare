//
//  ActiveViewController.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 21/12/20.
//

import UIKit
import StepView

class ActiveViewController: UIViewController {

    @IBOutlet weak var stepsBackView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet private weak var stepView: StepView!
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet weak var navigationTitle: UILabel!
    
    private var pageViewController: UIPageViewController!
    
    fileprivate lazy var pages: [UIViewController] = {
        return [
            self.getViewController(withIdentifier: String.init(describing: EmergencyContactViewController.self)),
            self.getViewController(withIdentifier: String.init(describing: DNAViewController.self)),
            self.getViewController(withIdentifier: String.init(describing: SendViewController.self))
        ]
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    private func setupControllers() {
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.view.frame = containerView.bounds
        containerView.addSubview(pageViewController.view)
        
        if let firstController = pages.first {
            pageViewController.setViewControllers([firstController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    fileprivate func getViewController(withIdentifier identifier: String) -> UIViewController {
        return UIStoryboard(name: _storyboard_PO, bundle: nil).instantiateViewController(withIdentifier: identifier)
    }
    
    private func getControllerToShow(from index: Int) -> UIViewController? {
        if index - 1 < pages.count {
            return pages[index - 1]
        } else {
            print("Index is out of range")
            return nil
        }
    }
    @IBAction func nextButtonDidPress(_ sender: Any) {
        if stepView.selectedStep == 1 {
            navigationTitle.text = "DNA Test"
            nextButton.setTitle("Swab", for: .normal)
        } else if  stepView.selectedStep == 2 {
            navigationTitle.text = "Send"
            nextButton.setTitle("Send", for: .normal)
        }
        stepView.showNextStep()
        
        if let controllerToShow = getControllerToShow(from: stepView.selectedStep) {
            pageViewController.setViewControllers([controllerToShow], direction: .forward, animated: true, completion: nil)
        }
    }
    @IBAction func navigationBackButtonPressed(_ sender: UIButton) {
        if stepView.selectedStep == 3 {
            navigationTitle.text = "DNA Test"
        } else if  stepView.selectedStep == 2 {
            navigationTitle.text = "Activate"
        }
        if stepView.selectedStep == 1 {
            self.navigationController?.popViewController(animated: true)
        } else {
            stepView.showPreviousStep()
            if let controllerToShow = getControllerToShow(from: stepView.selectedStep) {
                pageViewController.setViewControllers([controllerToShow], direction: .reverse, animated: true, completion: nil)
            }
        }
    }
}
