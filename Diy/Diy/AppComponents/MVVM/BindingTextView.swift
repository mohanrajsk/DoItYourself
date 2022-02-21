//
//  BindingTextView.swift
//  You Go
//
//  Created by Mohanraj S K on 08/08/21.
//

import UIKit

class BindingTextView: UITextView, UITextViewDelegate {

    var textChangeClosure: (String) -> Void = { _ in }

    override var text: String? {
        willSet(newValue) {
            self.textChangeClosure(newValue ?? "")
        }
    }

    override public init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        commonInit()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func bind(callback: @escaping (String) -> Void) {
        self.textChangeClosure = callback
    }

    private func commonInit() {
        self.delegate = self
    }

    func textViewDidChange(_ textView: UITextView) { // Handle the text changes here
        if let text = textView.text {
             self.textChangeClosure(text)
        }
    }
}
