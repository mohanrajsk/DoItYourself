//
//  ChooseDeviceVM.swift
//  Diy
//
//  Created by Mohanraj S K on 18/02/22.
//

import UIKit

protocol ChooseDeviceVMUIProtocol: AnyObject {
    func handleValidation(message: String)
    func navigateToNextScreen()
    func setUserData(diyModel: DIYModel)
}

class ChooseDeviceVM: NSObject {

    // MARK: Properties

    weak var delegate: ChooseDeviceVMUIProtocol?

    // Input Fields

    var selectedDevice = InputViewModel()

    init(delegate: ChooseDeviceVMUIProtocol?) {
        self.delegate = delegate
    }

}

// MARK: Instance Methods

extension ChooseDeviceVM {

    func validate() -> Bool {

        if selectedDevice.data.isEmpty {
            delegate?.handleValidation(message: "Please choose a device")
            return false
        }
        return true

    }

    func save() {

        if validate() {
            
            if let diyModel = DefaultsManager.shared.diyModel {
                diyModel.deviceType = selectedDevice.data
                DefaultsManager.shared.diyModel = diyModel
                delegate?.navigateToNextScreen()
            }

        }

    }

    func saveSelection(device: String) {
        selectedDevice.data = device
    }

    func loadUserData() {
        if let diyModel = DefaultsManager.shared.diyModel {
            selectedDevice.data = diyModel.deviceType
            delegate?.setUserData(diyModel: diyModel)
        }
    }

}
