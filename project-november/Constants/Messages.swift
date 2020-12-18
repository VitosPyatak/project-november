import Foundation

enum ErrorMessages {
    static let noFirstName = "No first name provided"
    static let noUsers = "There are no users, yet"
    static let noPhotos = "There are no photos, yet"
}

enum ValidationErrors {
    static let firstName = "Invalid first name"
    static let lastName = "Invalid last name"
    static let phoneNumber = "Invalid phone number"
    static let email = "Invalid email"
    static let password = "Invalid passwords or they do not match"
    static let passwordConfirmation = "Invalid passwords or they do not match"
    static let field = "This field is invalid"
}

enum RegisterTextFieldLabels {
    static let firstName = "First name"
    static let lastName = "Last name"
    static let phoneNumber = "Phone number"
    static let email = "Email"
    static let password = "Password"
    static let passwordConfirmation = "Confirm password"
}
