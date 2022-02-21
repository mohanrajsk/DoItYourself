//
//  UIButton+Design.swift
//  diy
//
//  Created by Mohanraj S K on 18/02/22.
//

import Foundation
import UIKit

extension UIButton {

    func setAsOutline() {
        self.setTitleColor(ColorAsset.btnSecondaryTitle.color, for: .normal)
        self.setTitleColor(ColorAsset.btnSecondaryTitle.color, for: .selected)
        self.backgroundColor = ColorAsset.btnSecondaryBg.color
        self.setAsRoundedCorner(cornerRadius: 10.0, borderWidth: 1, borderColor: UIColor.clear)
        self.setAsCardView()
    }

    func setAsFilled(disableCard: Bool = false) {
        self.backgroundColor = ColorAsset.btnPrimaryBg.color
        self.titleLabel?.textColor = UIColor.white
        self.setTitleColor(ColorAsset.btnPrimaryTitle.color, for: .normal)
        self.setTitleColor(ColorAsset.btnPrimaryTitle.color, for: .selected)
        self.setAsRoundedCorner(cornerRadius: 10.0, borderWidth: 1, borderColor: UIColor.clear)
        if !disableCard {
            self.setAsCardView()
        }
    }

    func setSelection(_ status: Bool) {
        self.isSelected = status
        if status {
            self.setTitleColor(ColorAsset.btnPrimaryTitle.color, for: .normal)
            self.setTitleColor(ColorAsset.btnPrimaryTitle.color, for: .selected)
            self.backgroundColor = ColorAsset.btnPrimaryBg.color
        } else {
            self.setTitleColor(ColorAsset.btnSelectionColor.color, for: .normal)
            self.setTitleColor(ColorAsset.btnSelectionColor.color, for: .selected)
            self.backgroundColor = ColorAsset.appPrimaryLight.color
        }
    }
}
