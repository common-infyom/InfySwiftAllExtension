//
// Created by Dhvl Golakiya on 02/04/16.
// Copyright (c) 2016 Dhvl Golakiya. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics

extension UILabel {
    
    // Get Estimated size
    public func getEstimatedSize(_ width: CGFloat = CGFloat.greatestFiniteMagnitude, height: CGFloat = CGFloat.greatestFiniteMagnitude) -> CGSize {
        return sizeThatFits(CGSize(width: width, height: height))
    }
    
    // Get Estimated Height
    public func getEstimatedHeight() -> CGFloat {
        return sizeThatFits(CGSize(width: self.getWidth, height: CGFloat.greatestFiniteMagnitude)).height
    }
    
    // Get Estimated width
    public func getEstimatedWidth() -> CGFloat {
        return sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: self.getHeight)).width
    }
    
    // Set Label Height
    public func fitHeight() {
        self.setHeight(height: getEstimatedHeight())
    }
    
    //  Set Label width
    public func fitWidth() {
        self.setWidth(width: getEstimatedWidth())
    }
    
    //  Sel Label SIze
    public func fitSize() {
        self.fitWidth()
        self.fitHeight()
        sizeToFit()
    }
    
    //  Get line text in Array of String
    public func getLinesArrayOfString() -> [String] {
        
        let text:NSString = self.text! as NSString
        let font:UIFont = self.font
        self.lineBreakMode = .byWordWrapping
        let myFont:CTFont = CTFontCreateWithName(font.fontName as CFString?, font.pointSize, nil)
        let attStr:NSMutableAttributedString = NSMutableAttributedString(string: text as String)
        attStr.addAttribute(String(kCTFontAttributeName), value:myFont, range: NSMakeRange(0, attStr.length))
        let frameSetter:CTFramesetter = CTFramesetterCreateWithAttributedString(attStr as CFAttributedString)
        let path:CGMutablePath = CGMutablePath()
        path.addRect(CGRect(x: 0, y: 0, width: getScreenWidth() - 30 , height: 100000))
        let frame:CTFrame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, nil)
        let lines = CTFrameGetLines(frame) as NSArray
        var linesArray = [String]()
        
        for line in lines {
            let lineRange = CTLineGetStringRange(line as! CTLine)
            let range:NSRange = NSMakeRange(lineRange.location, lineRange.length)
            let lineString = text.substring(with: range)
            linesArray.append(lineString as String)
        }
        return linesArray
    }
    
    //  Get specif line text
    
    public func getLinesArrayOfString(_ lineNumber : Int) -> String {
        let lines = self.getLinesArrayOfString()
        if lineNumber <= lines.count {
            return lines[lineNumber]
        }
        return ""
    }
    
    func fullRange() -> NSRange {
        return NSMakeRange(0, (text ?? "").characters.count)
    }
    
    // MARK: Range Formatter
    
    func setTextColor(color: UIColor, range: NSRange?) {
        guard let range = range else { return }
        let text = mutableAttributedString()
        text.addAttribute(NSForegroundColorAttributeName, value: color, range: range)
        attributedText = text
    }
    
    func setFont(font: UIFont, range: NSRange?) {
        guard let range = range else { return }
        let text = mutableAttributedString()
        text.addAttribute(NSFontAttributeName, value: font, range: range)
        attributedText = text
    }
    
    // MARK: Set Text Underline
    
    func setTextUnderline(color: UIColor, range: NSRange?) {
        setTextUnderline(color: color, range: range, byWord: false)
    }
    
    func setTextUnderline(color: UIColor, range: NSRange?, byWord: Bool) {
        guard let range = range else { return }
        let text = mutableAttributedString()
        var style = NSUnderlineStyle.styleSingle.rawValue
        if byWord { style = style | NSUnderlineStyle.byWord.rawValue }
        text.addAttribute(NSUnderlineStyleAttributeName, value: NSNumber(value: style as Int), range: range)
        text.addAttribute(NSUnderlineColorAttributeName, value: color, range: range)
        attributedText = text
    }
    
    // MARK: Set Text WithoutUnderline
    func setTextWithoutUnderline(range: NSRange?) {
        guard let range = range else { return }
        let text = mutableAttributedString()
        text.removeAttribute(NSUnderlineStyleAttributeName, range: range)
        attributedText = text
    }
    
    // MARK: String Formatter
    
    func rangeOf(string: String) -> NSRange? {
        let range = NSString(string: text ?? "").range(of: string)
        return range.location != NSNotFound ? range : nil
    }
    
    func setTextColor(color: UIColor, string: String) {
        setTextColor(color: color, range: rangeOf(string: string))
    }
    
    func setFont(font: UIFont, string: String) {
        setFont(font: font, range: rangeOf(string: string))
    }
    
    func setTextUnderline(color: UIColor, string: String) {
        setTextUnderline(color: color, range: rangeOf(string: string))
    }
    
    func setTextUnderline(color: UIColor, string: String, byWord: Bool) {
        setTextUnderline(color: color, range: rangeOf(string: string), byWord: byWord)
    }
    
    func setTextWithoutUnderline(string: String) {
        setTextWithoutUnderline(range: rangeOf(string: string))
    }
    
    // MARK: After Formatter
    
    func rangeAfter(string: String) -> NSRange? {
        guard var range = rangeOf(string: string) else { return nil }
        
        range.location = range.location + range.length
        range.length = text!.characters.count - range.location
        return range
    }
    
    func setTextColor(color: UIColor, after: String) {
        setTextColor(color: color, range: rangeAfter(string: after))
    }
    
    func setFont(font: UIFont, after: String) {
        setFont(font: font, range: rangeAfter(string: after))
    }
    
    func setTextUnderline(color: UIColor, after: String) {
        setTextUnderline(color: color, range: rangeAfter(string: after))
    }
    
    func setTextUnderline(color: UIColor, after: String, byWord: Bool) {
        setTextUnderline(color: color, range: rangeAfter(string: after), byWord: byWord)
    }
    
    func setTextWithoutUnderline(after: String) {
        setTextWithoutUnderline(range: rangeAfter(string: after))
    }
    
    // MARK: Before Formatter
    
    func rangeBefore(string: String) -> NSRange? {
        guard var range = rangeOf(string: string) else { return nil }
        
        range.length = range.location
        range.location = 0
        return range
    }
    
    func setTextColor(color: UIColor, before: String) {
        setTextColor(color: color, range: rangeBefore(string: before))
    }
    
    func setFont(font: UIFont, before: String) {
        setFont(font: font, range: rangeBefore(string: before))
    }
    
    func setTextUnderline(color: UIColor, before: String) {
        setTextUnderline(color: color, range: rangeBefore(string: before))
    }
    
    func setTextUnderline(color: UIColor, before: String, byWord: Bool) {
        setTextUnderline(color: color, range: rangeBefore(string: before), byWord: byWord)
    }
    
    func setTextWithoutUnderline(before: String) {
        setTextWithoutUnderline(range: rangeBefore(string: before))
    }
    
    // MARK: After & Before Formatter
    
    func rangeAfter(_ after: String, before: String) -> NSRange? {
        guard let rAfter = rangeAfter(string: after) else { return nil }
        guard let rBefore = rangeBefore(string: before) else { return nil }
        
        if rAfter.location < rBefore.length {
            return NSMakeRange(rAfter.location, rBefore.length - rAfter.location)
        }
        
        return nil
    }
    
    func setTextColor(color: UIColor, after: String, before: String) {
        setTextColor(color: color, range: rangeAfter(after, before: before))
    }
    
    func setFont(font: UIFont, after: String, before: String) {
        setFont(font: font, range: rangeAfter(after, before: before))
    }
    
    func setTextUnderline(color: UIColor, after: String, before: String) {
        setTextUnderline(color: color, range: rangeAfter(after, before: before))
    }
    
    func setTextUnderline(color: UIColor, after: String, before: String, byWord: Bool) {
        setTextUnderline(color: color, range: rangeAfter(after, before: before), byWord: byWord)
    }
    
    func setTextWithoutUnderline(after: String, before: String) {
        setTextWithoutUnderline(range: rangeAfter(after, before: before))
    }
    
    // MARK: From Formatter
    
    func rangeFrom(string: String) -> NSRange? {
        guard var range = rangeOf(string: string) else { return nil }
        
        range.length = text!.characters.count - range.location
        return range
    }
    
    func setTextColor(color: UIColor, from: String) {
        setTextColor(color: color, range: rangeFrom(string: from))
    }
    
    func setFont(font: UIFont, from: String) {
        setFont(font: font, range: rangeFrom(string: from))
    }
    
    func setTextUnderline(color: UIColor, from: String) {
        setTextUnderline(color: color, range: rangeFrom(string: from))
    }
    
    func setTextUnderline(color: UIColor, from: String, byWord: Bool) {
        setTextUnderline(color: color, range: rangeFrom(string: from), byWord: byWord)
    }
    
    func setTextWithoutUnderline(from: String) {
        setTextWithoutUnderline(range: rangeFrom(string: from))
    }
    
    // MARK: To Formatter
    
    func rangeTo(string: String) -> NSRange? {
        guard var range = rangeOf(string: string) else { return nil }
        
        range.length = range.location + range.length
        range.location = 0
        return range
    }
    
    func setTextColor(color: UIColor, to: String) {
        setTextColor(color: color, range: rangeTo(string: to))
    }
    
    func setFont(font: UIFont, to: String) {
        setFont(font: font, range: rangeTo(string: to))
    }
    
    func setTextUnderline(color: UIColor, to: String) {
        setTextUnderline(color: color, range: rangeTo(string: to))
    }
    
    func setTextUnderline(color: UIColor, to: String, byWord: Bool) {
        setTextUnderline(color: color, range: rangeTo(string: to), byWord: byWord)
    }
    
    func setTextWithoutUnderline(to: String) {
        setTextWithoutUnderline(range: rangeTo(string: to))
    }
    
    // MARK: From & To Formatter
    
    func rangeFrom(from: String, to: String) -> NSRange? {
        guard let rFrom = rangeFrom(string: from) else { return nil }
        guard let rTo = rangeTo(string: to) else { return nil }
        
        if rFrom.location < rTo.length {
            return NSMakeRange(rFrom.location, rTo.length - rFrom.location)
        }
        
        return nil
    }
    
    func setTextColor(color: UIColor, from: String, to: String) {
        setTextColor(color : color, range: rangeFrom(from: from, to: to))
    }
    
    func setFont(font: UIFont, from: String, to: String) {
        setFont(font: font, range: rangeFrom(from: from, to: to))
    }
    
    func setTextUnderline(color: UIColor, from: String, to: String) {
        setTextUnderline(color: color, range: rangeFrom(from: from, to: to))
    }
    
    func setTextUnderline(color: UIColor, from: String, to: String, byWord: Bool) {
        setTextUnderline(color: color, range: rangeFrom(from: from, to: to), byWord: byWord)
    }
    
    func setTextWithoutUnderline(from: String, to: String) {
        setTextWithoutUnderline(range: rangeFrom(from: from, to: to))
    }
    
    // MARK: Helpers
    
    fileprivate func mutableAttributedString() -> NSMutableAttributedString {
        if attributedText != nil {
            return NSMutableAttributedString(attributedString: attributedText!)
        } else {
            return NSMutableAttributedString(string: text ?? "")
        }
    }
    
    func setLineHeight(lineHeight: CGFloat) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 1.0
        paragraphStyle.lineHeightMultiple = lineHeight
        paragraphStyle.alignment = self.textAlignment
        
        let attrString = NSMutableAttributedString(string: self.text!)
        attrString.addAttribute(NSFontAttributeName, value: self.font, range: NSMakeRange(0, attrString.length))
        attrString.addAttribute(NSParagraphStyleAttributeName, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
        self.attributedText = attrString
    }



    

}
