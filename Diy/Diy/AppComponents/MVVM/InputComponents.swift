//
//  InputComponents.swift
//  MVVM_Login
//
//

import Foundation

protocol ValidationViewModel {

    var errorMessage: String { get }
    var data: String { get set }
    func isValid(fieldName: String, minLength: Int, maxLength: Int, isEmail: Bool) -> Bool

}

extension ValidationViewModel {

    // To Apply Default parameters for the validation field
    func isValid(fieldName: String, minLength: Int = 1, maxLength: Int = 255, isEmail: Bool = false) -> Bool {
        return isValid(fieldName: fieldName, minLength: minLength, maxLength: maxLength, isEmail: isEmail)
    }

}

class InputViewModel: ValidationViewModel {

    var errorMessage: String = ""
    var data: String = ""

    // Validation properties
    func isValid(fieldName: String, minLength: Int = defaultMinLength, maxLength: Int = defaultMaxLength, isEmail: Bool = false) -> Bool {

        let fieldValue = data
        if fieldValue.trimmingCharacters(in: .whitespaces).count == 0 {
            errorMessage = "\(fieldName) cannot be empty"
            return false
        } else if fieldValue.count < minLength {
            errorMessage = "\(fieldName) should have minimum \(minLength) characters"
            return false
        } else if fieldValue.count > maxLength {
            errorMessage = "\(fieldName) cannot exceed \(maxLength) characters"
            return false
        } else if isEmail && !validatePattern(text: fieldValue) {
            errorMessage = "Enter valid email address"
            return false
        }
        return true

    }

    func validatePattern(text: String) -> Bool {

       let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
       let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
       return emailTest.evaluate(with: text)

    }

}
