//
//  UINavigationController+Ext.swift
//  Cafegram2EN
//
//  Created by Farukh IQBAL on 16/06/2018.
//  Copyright © 2018 Farukh IQBAL. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    // For Xcode 9 users, childForStatusBarStyle is equal to childViewControllerForStatusBarStyle
    open override var childForStatusBarStyle: UIViewController? {
        return topViewController
    }
}
