import Foundation

struct TextFieldInput: Identifiable {
    var id: FormFieldId
    var label: String
    var isSecured: Bool
    
    var input: String = EMPTY_STRING
    var isValid: Bool = true
    var isValidated: Bool = false
    
    init(id: FormFieldId, label: String, isSecured: Bool = false) {
        self.id = id
        self.label = label
        self.isSecured = isSecured
    }
    
}
