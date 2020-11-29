import Foundation

struct RegisterErrorMessages {
    private static let messages: [FormFieldId: String] = [
        .firstname: "Invalid first name",
        .lastname: "Invalid last name",
        .phoneNumber: "Invalid phone number",
        .email: "Invalid email",
        .password: "Invalid passwords or they do not match",
        .passwordConfirmation: "Invalid passwords or they do not match"
    ]
    
    static func get(by fieldId: FormFieldId) -> String {
        messages[fieldId]!
    }
}

struct RegisterLabels {
    private static let messages: [FormFieldId: String] = [
        .firstname: "First name",
        .lastname: "LastName",
        .phoneNumber: "Phone number",
        .email: "Email",
        .password: "Password",
        .passwordConfirmation: "Confirm password"
    ]
    
    static func get(by fieldId: FormFieldId) -> String {
        messages[fieldId]!
    }
}
