import Foundation
import SwiftUI

enum TextFieldType {
    case firstname
    case lastname
    case email
    case phoneNumber
    case password
    case passwordConfirmation
    
    func keyboardType() -> UIKeyboardType {
        switch self {
        case .phoneNumber:
            return .numberPad
        default:
            return .default
        }
    }
    
    func validationError() -> String {
        switch self {
        case .firstname:
            return ValidationErrors.firstName
        case .lastname:
            return ValidationErrors.lastName
        case .phoneNumber:
            return ValidationErrors.phoneNumber
        case .email:
            return ValidationErrors.email
        case .password, .passwordConfirmation:
            return ValidationErrors.password
        }
    }
    
    func label() -> String {
        switch self {
        case .firstname:
            return RegisterTextFieldLabels.firstName
        case .lastname:
            return RegisterTextFieldLabels.lastName
        case .phoneNumber:
            return RegisterTextFieldLabels.phoneNumber
        case .email:
            return RegisterTextFieldLabels.email
        case .password:
            return RegisterTextFieldLabels.password
        case .passwordConfirmation:
            return RegisterTextFieldLabels.passwordConfirmation
        }
    }
    
    func validationRegex() -> String {
        switch self {
        case .firstname, .lastname:
            return InputRegex.firstName
        case .phoneNumber:
            return InputRegex.phoneNumber
        case .email:
            return InputRegex.email
        case .password, .passwordConfirmation:
            return InputRegex.password
        }
    }
    
    func isSecure() -> Bool {
        switch self {
        case .password, .passwordConfirmation:
            return true
        default:
            return false
        }
    }
}
