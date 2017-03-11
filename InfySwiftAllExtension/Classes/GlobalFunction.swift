//
//  ConstantFunction.swift
//  SwiftAllExtension
//
//  Created by Dhvl Golakiya on 27/02/17.
//  Copyright © 2017 infyom. All rights reserved.
//

import Foundation
import UIKit

//  Get Screen Height
    public func getScreenHeight() -> CGFloat {
        let screenBound : CGRect = UIScreen.main.bounds
        return screenBound.size.height
    }

//  Get Screen Width
    public func getScreenWidth() -> CGFloat {
        let screenBound : CGRect = UIScreen.main.bounds
        return screenBound.size.width
    }

//  Get TintedImage From Image
    public func getTintedImageFromImage(image : UIImage) -> UIImage {
        return image.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
    }

//  Get Two Date Difference
    func getTwoDateDifference(from : Date , to : Date) -> Bool{
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [.day]
        formatter.zeroFormattingBehavior = .pad
        let dateString = formatter.string(from: from, to: to)!
        let string = dateString.substring(to: dateString.index(dateString.endIndex, offsetBy: -1))
        print(string)
        if Int(string)! > 30{
            return false
        }else if Int(string)! >= 7{
            return true
        }else{
            return false
        }
    }
