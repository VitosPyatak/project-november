import Foundation

struct TextFieldInput: Identifiable {
    var id = UUID()
    var type: TextFieldType
    
    var input: String = Strings.empty
    var isValid: Bool = true
    var isValidated: Bool = false
    
    init(_ type: TextFieldType) {
        self.type = type
    }
    
    func label() -> String {
        isValid ? type.label() : type.validationError()
    }
    
    func isSecure() -> Bool {
        type.isSecure()
    }
}
