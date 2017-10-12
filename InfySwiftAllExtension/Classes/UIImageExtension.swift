//
//  UIImageExtension.swift
//  SwiftAllExtension
//
//  Created by Dhvl Golakiya on 27/02/17.
//  Copyright © 2017 infyom. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    func tintedImage() -> UIImage {
        return self.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
    }
}
