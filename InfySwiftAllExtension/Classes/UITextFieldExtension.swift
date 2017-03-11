//
//  UITextFieldExtension.swift
//  SwiftAllExtension
//
//  Created by Dhvl Golakiya on 27/02/17.
//  Copyright © 2017 infyom. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    func underlined(){
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    func applyPaddingView(padding : CGFloat) {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: self.getHeight))
        self.leftView = view
        self.leftViewMode = .always
    }
    
}
class CustomSearchTextField: UITextField, UITextFieldDelegate {
    override func awakeFromNib() {
        super.awakeFromNib()
        delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.text?.length == 0 && string == " " {
            return false
        } else if textField.text?.characters.last == " " && string == " " {
            return false
        }else{
            return true
        }
    }
}
