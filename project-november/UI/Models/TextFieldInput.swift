import Foundation

struct TextFieldInput: Identifiable {
    var id = UUID()
    var type: TextFieldType
    var label: String
    var isSecured: Bool
    
    var input: String = Strings.empty
    var isValid: Bool = true
    var isValidated: Bool = false
    
    init(_ type: TextFieldType, isSecured: Bool = false) {
        self.type = type
        self.label = type.validationError()
        self.isSecured = isSecured
    }
    
    
    func validationError() -> String {
        type.validationError()
    }
    
    func successLabel() -> String {
        type.label()
    }
}
