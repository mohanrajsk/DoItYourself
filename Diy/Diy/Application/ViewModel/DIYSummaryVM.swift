//
//  DIYSummaryVM.swift
//  Diy
//
//  Created by Mohanraj S K on 19/02/22.
//

import UIKit

protocol DIYSummaryVMUIProtocol: AnyObject {
    func handleValidation(message: String)
    func navigateToNextScreen()
    func popToDeviceSelection()
    func setUserData(diyModel: DIYModel)
}

class DIYSummaryVM: NSObject {
    
    // MARK: Properties

    weak var delegate: DIYSummaryVMUIProtocol?

    // Input Fields

    var selectedDevice = InputViewModel()
    var deviceSerialNumber = InputViewModel()
    var deviceVersion = InputViewModel()
    var deviceName = InputViewModel()

    init(delegate: DIYSummaryVMUIProtocol?) {
        self.delegate = delegate
    }

}

// MARK: Instance Methods

extension DIYSummaryVM {

    func validate() -> Bool {

        if !selectedDevice.isValid(fieldName: "Selected device") {
            delegate?.handleValidation(message: selectedDevice.errorMessage)
            return false
        } else if !deviceSerialNumber.isValid(fieldName: "Device serial number") {
            delegate?.handleValidation(message: deviceSerialNumber.errorMessage)
            return false
        }  else if !deviceVersion.isValid(fieldName: "Device version") {
            delegate?.handleValidation(message: deviceVersion.errorMessage)
            return false
        }  else if !deviceName.isValid(fieldName: "Device name") {
            delegate?.handleValidation(message: deviceName.errorMessage)
            return false
        }
        return true

    }

    func save() {

        if validate() {
            if let diyModel = DefaultsManager.shared.diyModel,
                selectedDevice.data == diyModel.deviceType,
                deviceSerialNumber.data == validDeviceSerialNumber,
                deviceVersion.data == validDeviceVersion,
                deviceName.data == validDeviceName {

                // Save
                diyModel.deviceSerialNumber = deviceSerialNumber.data
                diyModel.deviceName = deviceName.data
                diyModel.deviceVersion = deviceVersion.data
                DefaultsManager.shared.diyModel = diyModel

                // Move to next screen
                delegate?.navigateToNextScreen()

            } else {
                delegate?.popToDeviceSelection()
            }
        }

    }

    func loadUserData() {

        if let diyModel = DefaultsManager.shared.diyModel {
            delegate?.setUserData(diyModel: diyModel)
        }

    }

}
