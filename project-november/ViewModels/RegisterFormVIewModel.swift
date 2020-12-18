import Foundation

class RegisterFormViewModel: ObservableObject {
    @Published private var formFields = createFormFields()
    private var areAllInputsValid = false
    
    var fields: [TextFieldInput] {
        get { formFields }
        set { formFields = newValue }
    }
        
    func validateFields() {
        for (index, field) in formFields.enumerated() {
            processFormField(formField: field, index: index)
        }
        
        if areAllFieldsValid() {
            processPasswordMatching()
        }
    }
    
    func areAllFieldsValid() -> Bool {
        formFields.allSatisfy { field in field.isValid }
    }
    
    func getField(by type: TextFieldType) -> TextFieldInput {
        formFields.first { field in field.type == type }!
    }
    
    func getField(by index: Int) -> TextFieldInput {
        formFields[index]
    }
    
    func getLabel(by index: Int) -> String {
        getField(by: index).label()
    }
    
    private func processFormField(formField: TextFieldInput, index: Int) {
        if ValidationService.validate(formField.input, by: formField.type) {
            modifyFieldOnSuccessfullValidation(by: index)
        } else {
            modifyFieldOnInvalidInput(by: index)
        }
    }
    
    private func modifyFieldOnSuccessfullValidation(by index: Int) {
        formFields[index].isValid = true
        formFields[index].isValidated = true
    }
    
    private func modifyFieldOnInvalidInput(by index: Int) {
        formFields[index].isValid = false
        formFields[index].isValidated = true
    }
    
    private func processPasswordMatching() {
        if !ValidationService.validateValuesMatching(of: getPasswordFields()) {
            for index in formFields.indices where formFields[index].type == .passwordConfirmation {
                modifyFieldOnInvalidInput(by: index)
            }
        }
    }
    
    private func getPasswordFields() -> [TextFieldInput] {
        let passwordFieldsTypes: [TextFieldType] = [.password, .passwordConfirmation]
        return formFields.filter { field in passwordFieldsTypes.contains(field.type) }
    }
    
    private static func createFormFields() -> [TextFieldInput] {
        [
            TextFieldInput(.firstname),
            TextFieldInput(.lastname),
            TextFieldInput(.phoneNumber),
            TextFieldInput(.email),
            TextFieldInput(.password),
            TextFieldInput(.passwordConfirmation)
        ]
    }
}
