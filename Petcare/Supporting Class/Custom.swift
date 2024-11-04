//
//  CustomTextFiedl.swift
//  Petcare
//
//  Created by Navdeep Paliwal on 23/12/20.
//

import Foundation
import UIKit

@IBDesignable
class CustomView: UIView{
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        
        didSet{
            
            self.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet{
            
            self.layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        
        didSet {
            
            self.layer.borderColor = borderColor.cgColor
        }
    }
    override func prepareForInterfaceBuilder() {
        
        super.prepareForInterfaceBuilder()
    }
}
