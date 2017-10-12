//
//  UIButtonExtension.swift
//  SwiftAllExtension
//
//  Created by Dhvl Golakiya on 27/02/17.
//  Copyright © 2017 infyom. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    //  Apply corner radius
    public func applyCornerRadius(mask : Bool) {
        self.layer.masksToBounds = mask
        self.layer.cornerRadius = self.bounds.height/2
    }
    
    //  Set background color for state
    public func setBackgroundColor(color: UIColor, forState: UIControlState) {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.setBackgroundImage(colorImage, for: forState)
    }
    
    //  Set title text for all state
    public func textForAllState(titleText : String) {
        self.setTitle(titleText, for: .normal)
        self.setTitle(titleText, for: .selected)
        self.setTitle(titleText, for: .highlighted)
        self.setTitle(titleText, for: .disabled)
    }
    
    //  Set title text for only normal state
    public func textForNormal(titleText : String) {
        self.setTitle(titleText, for: .normal)
    }
    
    //  Set title text for only selected state
    public func textForSelected(titleText : String) {
        self.setTitle(titleText, for: .selected)
    }
    
    //  Set title text for only highlight state
    public func textForHighlighted(titleText : String) {
        self.setTitle(titleText, for: .highlighted)
    }
    
    //  Set image for all state
    public func imageForAllState(image : UIImage) {
        self.setImage(image, for: .normal)
        self.setImage(image, for: .selected)
        self.setImage(image, for: .highlighted)
        self.setImage(image, for: .disabled)
    }
    
    //  Set image for only normal state
    public func imageForNormal(image : UIImage) {
        self.setImage(image, for: .normal)
    }
    
    //  Set image for only selected state
    public func imageForSelected(image : UIImage) {
        self.setImage(image, for: .selected)
    }
    
    //  Set image for only highlighted state
    public func imageForHighlighted(image : UIImage) {
        self.setImage(image, for: .highlighted)
    }
    
    //  Set title color for all state
    public func colorOfTitleLabelForAllState(color : UIColor) {
        self.setTitleColor(color, for: .normal)
        self.setTitleColor(color, for: .selected)
        self.setTitleColor(color, for: .highlighted)
        self.setTitleColor(color, for: .disabled)
    }
    
    //  Set title color for normal state
    public func colorOfTitleLabelForNormal(color : UIColor) {
        self.setTitleColor(color, for: .normal)
    }
    
    //  Set title color for selected state
    public func colorOfTitleLabelForSelected(color : UIColor) {
        self.setTitleColor(color, for: .selected)
    }
    
    //  Set title color for highkighted state
    public func colorForHighlighted(color : UIColor) {
        self.setTitleColor(color, for: .highlighted)
    }
}
