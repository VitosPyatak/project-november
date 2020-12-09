import Foundation

enum InputRegex {
    static let firstName = "^(([^ ]?)(^[a-zA-Z].*[a-zA-Z]$)([^ ]?))$"
    static let lastName = "^(([^ ]?)(^[a-zA-Z].*[a-zA-Z]$)([^ ]?))$"
    static let phoneNumber = "^\\d{10}$"
    static let email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    static let password = "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}"
    static let passwordConfirmation = "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}"
}
