//
//  UITextfield+Design.swift
//  Diy
//
//  Created by Mohanraj S K on 18/02/22.
//

import UIKit

extension UITextField {

    func setAsAppTextField(borderColor: CGColor = ColorAsset.txtBorder.color.cgColor) {
        self.textColor = ColorAsset.txtTitle.color
        createBottomLine(lineColor: borderColor, lineHeight: 0.5)
    }

}
