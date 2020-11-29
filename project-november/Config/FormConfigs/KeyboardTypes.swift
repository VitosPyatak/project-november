import Foundation
import SwiftUI

struct KeyboardTypes {
    private static let keyboardTypes: [FormFieldId: UIKeyboardType] = [
        .firstname: .default,
        .lastname: .default,
        .phoneNumber: .numberPad,
        .email: .default,
        .password: .default,
        .passwordConfirmation: .default
    ]
    
    static func get(_ id: FormFieldId) -> UIKeyboardType {
        keyboardTypes[id]!
    }
}
