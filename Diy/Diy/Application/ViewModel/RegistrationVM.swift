//
//  RegistrationVM.swift
//  Diy
//
//  Created by Mohanraj S K on 18/02/22.
//

import UIKit

protocol RegistrationVMUIProtocol: AnyObject {
    func handleValidation(message: String)
    func navigateToNextScreen()
    func setUserData(diyModel: DIYModel)
}

class RegistrationVM: NSObject {

    // MARK: Properties

    weak var delegate: RegistrationVMUIProtocol?

    // Input Fields

    var firstName = InputViewModel()
    var lastName = InputViewModel()
    var emailAddress = InputViewModel()
    var address = InputViewModel()
    var pinCode = InputViewModel()

    init(delegate: RegistrationVMUIProtocol?) {
        self.delegate = delegate
    }

}

// MARK: Instance Methods

extension RegistrationVM {

    func validate() -> Bool {

        if !firstName.isValid(fieldName: "First Name") {
            delegate?.handleValidation(message: firstName.errorMessage)
            return false
        } else if !lastName.isValid(fieldName: "Last Name") {
            delegate?.handleValidation(message: lastName.errorMessage)
            return false
        } else if !emailAddress.isValid(fieldName: "Email", minLength: emailMinLength, maxLength: emailMaxLength, isEmail: true) {
            delegate?.handleValidation(message: emailAddress.errorMessage)
            return false
        } else if !address.isValid(fieldName: "Address", minLength: addressMinLength, maxLength: addressMaxLength) {
            delegate?.handleValidation(message: address.errorMessage)
            return false
        } else if !pinCode.isValid(fieldName: "Pincode", minLength: pincodeLength, maxLength: pincodeLength) {
            delegate?.handleValidation(message: pinCode.errorMessage)
            return false
        }
        return true

    }

    func save() {

        if validate() {

            let diyModel = DefaultsManager.shared.diyModel ?? DIYModel()
            diyModel.firstName = firstName.data
            diyModel.lastName = lastName.data
            diyModel.emailAddress = emailAddress.data
            diyModel.address = address.data
            diyModel.pinCode = pinCode.data

            // Save Data in user defaults
            DefaultsManager.shared.diyModel = diyModel
            delegate?.navigateToNextScreen()

        }

    }

    func loadUserData() {
        if let diyModel = DefaultsManager.shared.diyModel {
            self.delegate?.setUserData(diyModel: diyModel)
        }
    }

}
