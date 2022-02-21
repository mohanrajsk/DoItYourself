//
//  BLEDetectionVM.swift
//  Diy
//
//  Created by Mohanraj S K on 19/02/22.
//

import UIKit

protocol BLEDetectionVMUIProtocol: AnyObject {
    func handleValidation(message: String)
    func navigateToNextScreen()
}

typealias ValidationCallback = ((Bool) -> Void)

class BLEDetectionVM: NSObject {
    
    // MARK: Properties

    weak var delegate: BLEDetectionVMUIProtocol?
    var bleManager: BLEManager?

    // Input Fields

    init(delegate: BLEDetectionVMUIProtocol?) {
        self.delegate = delegate
    }

}

// MARK: Instance Methods

extension BLEDetectionVM {

    func validate(callback: @escaping ValidationCallback) {

        bleManager = BLEManager { state in
            if state != .poweredOn {
                callback(false)
            } else {
                callback(true)
            }
        }

    }

    func checkBLEEnabledAndMoveToNext() {

        validate { [weak self] success in
            if success {
                UIHelper.appDelegate.forceEnableBLE = true
                self?.delegate?.navigateToNextScreen()
            }
        }

    }

}
