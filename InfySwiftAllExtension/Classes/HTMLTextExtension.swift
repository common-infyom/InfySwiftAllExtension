//
//  HTMLTextExtension.swift
//  SwiftAllExtension
//
//  Created by Dhvl Golakiya on 27/02/17.
//  Copyright © 2017 infyom. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    func setHTMLFromString(text: String) {
        do {
            let modifiedFont = NSString(format:"<span style=\"font-family: \(self.font!.fontName); font-size: \(self.font!.pointSize)\">%@</span>" as NSString, text) as String
            let attrStr = try NSAttributedString(data: modifiedFont.data(using: String.Encoding.unicode)!,
                                                 options: [.documentType: NSAttributedString.DocumentType.html,
                                                           .characterEncoding: String.Encoding.utf8.rawValue],
                                                 documentAttributes: nil)
            self.attributedText = attrStr
        }
        catch {
            self.attributedText = nil
            self.text = text
        }
    }
}

extension String {
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: Data(utf8),options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}

