//
//  UIViewController+Design.swift
//  diy
//
//  Created by Mohanraj S K on 18/02/22.
//

import Foundation
import UIKit

extension UIViewController {

    static func loadFromNib() -> Self {

        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }

        return instantiateFromNib()

    }

    func configureCancelNavigationItem() {

        let barButtonItem = UIBarButtonItem(title: "Cancel", style: .done,
                                            target: self, action: #selector(cancelAction))
        navigationItem.rightBarButtonItem = barButtonItem
        navigationItem.setHidesBackButton(true, animated: true)

    }

    @objc
    func cancelAction() {

        let alert: UIAlertController! = UIAlertController(title: UIHelper.shared.getAppName(),
                                                          message: "Are you sure that you want to cancel?",
                                                          preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { [weak self] _ in
            DefaultsManager.shared.diyModel = nil
            self?.navigationController?.popToRootViewController(animated: true)
        }))

        self.navigationController?.present(alert, animated: true, completion: nil)

    }

}
