import Foundation

struct UserBuilder {
    static func build(from formFields: [TextFieldInput]) -> User {
        var newUser = User()
        for formField in formFields {
            buildProperty(with: formField, for: &newUser)
        }
        return newUser
    }
    
    private static func buildProperty(with field: TextFieldInput, for user: inout User) {
        let fieldInputValue = field.input
        switch field.type {
            case .firstname:
                user.firstName = fieldInputValue
            case .lastname:
                user.lastName = fieldInputValue
            case .phoneNumber:
                user.phoneNumber = fieldInputValue
            case .email:
                user.email = fieldInputValue
            case .password:
                user.password = fieldInputValue
            default: return
        }
    }
}
