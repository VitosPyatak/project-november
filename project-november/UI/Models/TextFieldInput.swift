import Foundation

struct TextFieldInput: Identifiable {
    var id = UUID()
    var fieldId: FormFieldId
    var label: String
    var isSecured: Bool
    
    var input: String = Strings.empty
    var isValid: Bool = true
    var isValidated: Bool = false
    
    init(id: FormFieldId, label: String, isSecured: Bool = false) {
        self.fieldId = id
        self.label = label
        self.isSecured = isSecured
    }
    
}
