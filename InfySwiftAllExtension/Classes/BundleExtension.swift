//
//  BundleExtension.swift
//  BollyNxt
//
//  Created by Dhvl's iMac on 11/01/17.
//  Copyright © 2017 infyom. All rights reserved.
//

import Foundation
import UIKit

extension Bundle {
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}
