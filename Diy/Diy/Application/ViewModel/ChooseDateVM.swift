//
//  ChooseDateVM.swift
//  Diy
//
//  Created by Mohanraj S K on 19/02/22.
//

import UIKit

protocol ChooseDateVMUIProtocol: AnyObject {
    func handleValidation(message: String)
    func navigateToNextScreen()
    func setUserData(diyModel: DIYModel)
}

class ChooseDateVM: NSObject {

    // MARK: Properties

    weak var delegate: ChooseDateVMUIProtocol?

    // Input Fields

    var selectedDate = InputViewModel()

    init(delegate: ChooseDateVMUIProtocol?) {
        self.delegate = delegate
    }

}

// MARK: Instance Methods

extension ChooseDateVM {

    func validate() -> Bool {

        if !selectedDate.isValid(fieldName: "Date") {
            delegate?.handleValidation(message: "Please choose your date")
            return false
        }
        return true

    }

    func save() {

        if validate() {

            if let diyModel = DefaultsManager.shared.diyModel {
                diyModel.selectedDate = selectedDate.data
                DefaultsManager.shared.diyModel = diyModel
                delegate?.navigateToNextScreen()
            }

        }

    }

    func loadUserData() {

        if let diyModel = DefaultsManager.shared.diyModel {
            selectedDate.data = diyModel.selectedDate
            delegate?.setUserData(diyModel: diyModel)
        }

    }

}
