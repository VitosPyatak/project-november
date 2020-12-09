import Foundation

class RegisterFormViewModel: ObservableObject {
    @Published var model: FormModel = createModel()

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
    
    func getField(by id: TextFieldType) -> TextFieldInput {
        model.getField(by: id)
    }
    
    func getField(by index: Int) -> TextFieldInput {
        model.getField(by: index)
    }
    
    func getLabel(by index: Int) -> String {
        model.getLabel(by: index)
    }
    
    private static func createModel() -> FormModel {
        let formFields: [TextFieldInput] = [
            TextFieldInput(.firstname),
            TextFieldInput(.lastname),
            TextFieldInput(.phoneNumber),
            TextFieldInput(.email),
            TextFieldInput(.password, isSecured: true),
            TextFieldInput(.passwordConfirmation, isSecured: true)
        ]
        return FormModel(formFields: formFields)
    }
}
