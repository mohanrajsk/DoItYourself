//
//  UIView+Design.swift
//  SwiftCodeBase
//
//  Created by Jegan on 5/19/17.
//  Copyright © 2017 CodeBase. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

    func setAsRoundedCorner(cornerRadius: CGFloat = 10.0,
                            borderWidth: CGFloat = 1.0,
                            borderColor: UIColor = ColorAsset.appPrimaryLight.color) {

        // Corner Radius
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true

        // Add borders
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor

    }

    func setAsCardView(custom: CGFloat = 10) {

        self.layer.cornerRadius = custom
        let shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: custom)
        layer.cornerRadius = custom
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowOpacity = 0.2
        layer.shadowPath = shadowPath.cgPath

    }

    func createBottomLine(lineColor: CGColor = ColorAsset.txtBorder.color.cgColor, lineHeight: CGFloat = 0.5) {
        let bottomLayer: CALayer = CALayer()
        bottomLayer.frame = CGRect(origin: CGPoint(x: 0, y: self.bounds.size.height - lineHeight),
                                   size: CGSize(width: self.bounds.size.width, height: lineHeight))
        bottomLayer.backgroundColor = lineColor
        self.layer.addSublayer(bottomLayer)
        self.layer.masksToBounds = true
    }
}
