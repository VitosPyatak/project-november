import Foundation

struct InputRegex {
    private static let regexMap: [FormFieldId : String] = [
        .firstname: "^(([^ ]?)(^[a-zA-Z].*[a-zA-Z]$)([^ ]?))$",
        .lastname: "^(([^ ]?)(^[a-zA-Z].*[a-zA-Z]$)([^ ]?))$",
        .phoneNumber: "^\\d{10}$",
        .email: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}",
        .password: "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}",
        .passwordConfirmation: "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}"
    ]
    
    static func get(by id: FormFieldId) -> String {
        regexMap[id]!
    }
}

struct RegexFormats {
    static let SELF_MATCHES = "SELF MATCHES %@"
}
