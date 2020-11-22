import Foundation

class RegisterFormViewModel: ObservableObject {
    @Published private var model: FormModel<RegisterFormManager> = createModel()

    var fields: [TextFieldInput] {
        get { model.formFields }
        set { model.formFields = newValue }
    }
        
    func validateFields() {
        model.validateFields()
    }
    
    func areAllFieldsValid() -> Bool {
        model.areAllInputsValid
    }
    
    func getField(by id: FormFieldId) -> TextFieldInput {
        model.getField(by: id)
    }
    
    func getField(by index: Int) -> TextFieldInput {
        model.getField(by: index)
    }
    
    func getLabel(by index: Int) -> String {
        model.getLabel(by: index)
    }
    
    private static func createModel() -> FormModel<RegisterFormManager> {
        let formFields: [TextFieldInput] = [
            TextFieldInput(id: .firstname, label: RegisterLabels.get(by: .firstname)),
            TextFieldInput(id: .lastname, label: RegisterLabels.get(by: .lastname)),
            TextFieldInput(id: .phoneNumber, label: RegisterLabels.get(by: .phoneNumber)),
            TextFieldInput(id: .email, label: RegisterLabels.get(by: .email)),
            TextFieldInput(id: .password, label: RegisterLabels.get(by: .password), isSecured: true),
            TextFieldInput(id: .passwordConfirmation, label: RegisterLabels.get(by: .passwordConfirmation), isSecured: true)
        ]
        return FormModel(formFields: formFields, manager: RegisterFormManager())
    }
}
