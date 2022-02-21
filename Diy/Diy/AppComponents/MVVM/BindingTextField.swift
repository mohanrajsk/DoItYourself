//
//  BindingTextField.swift
//  GoodWeather
//
//  Created by Mohammad Azam on 12/5/18.
//  Copyright © 2018 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class BindingTextField: UITextField {

    var textChangeClosure: (String) -> Void = { _ in }

    override var text: String? {
        willSet(newValue) {
            self.textChangeClosure(newValue ?? "")
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func bind(callback: @escaping (String) -> Void) {
        self.textChangeClosure = callback
    }

    private func commonInit() {
        self.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
    }

    @objc func textFieldChange(_ textField: UITextField) {

        if let text = textField.text {
             self.textChangeClosure(text)
        }
    }
}
