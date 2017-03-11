//
//  ArrayExtension.swift
//  Infy-movies
//
//  Created by Dhvl Golakiya on 19/11/16.
//  Copyright © 2016 infyom. All rights reserved.
//

import Foundation

extension NSArray {
    
    //  Make Comma separated String from array
    public var toCommaString: String! {
        return self.componentsJoined(by: ", ")
    }
    
    public func toJsonString() -> String {
        do {
            //Convert to Data
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.prettyPrinted)

            //Convert back to string. Usually only do this for debugging
            if let JSONString = String(data: jsonData, encoding: String.Encoding.utf8) {
                print(JSONString)
                return JSONString
            }
            return ""
        } catch {
            return ""
        }
    }

}
extension NSDictionary {
    
    public func toJsonString() -> String {
        do {
            
            //Convert to Data
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.prettyPrinted)
            
            //Convert back to string. Usually only do this for debugging
            if let JSONString = String(data: jsonData, encoding: String.Encoding.utf8) {
                print(JSONString)
                return JSONString
            }
            return ""

        } catch {
            return ""
        }
    }
}
