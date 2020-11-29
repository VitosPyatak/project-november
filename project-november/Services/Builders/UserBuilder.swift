import Foundation

struct UserBuilder {
    static func build(from formFields: [TextFieldInput]) -> UserEntity {
        var newUser = UserEntity()
        for formField in formFields {
            buildProperty(with: formField, for: &newUser)
        }
        return newUser
    }
    
    private static func buildProperty(with field: TextFieldInput, for user: inout UserEntity) {
        let fieldInputValue = field.input
        switch field.fieldId {
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
        default:
            return
        }
    }
}
