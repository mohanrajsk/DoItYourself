//
//  UIColor+App.swift
//  diy
//
//  Created by Mohanraj S K on 18/02/22.
//

import Foundation
import UIKit

enum ColorAsset: String {

    // app

    case appPrimary
    case appWhite
    case appPrimaryLight

    // buttons
    case btnSelectionColor
    case btnPrimaryBg
    case btnPrimaryTitle
    case btnSecondaryBg
    case btnSecondaryTitle

    // input field
    case txtTitle
    case txtBorder

    var color: UIColor {
        return UIColor(named: self.rawValue) ?? UIColor.blue
    }
}
