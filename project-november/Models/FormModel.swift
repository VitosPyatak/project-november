import Foundation
import SwiftUI

struct FormModel<GenericForm> where GenericForm: FormManager {
    var formFields: [TextFieldInput]
    var formManager: GenericForm
    
    var areAllInputsValid: Bool = false
    
    init(formFields: [TextFieldInput], manager: GenericForm) {
        self.formFields = formFields
        self.formManager = manager
    }
    
    func getField(by id: FormFieldId) -> TextFieldInput {
        formFields.first(where: { field in field.fieldId == id})!
    }
    
    func getField(by index: Int) -> TextFieldInput {
        formFields[index]
    }
    
    func getLabel(by index: Int) -> String {
        formFields[index].label
    }
    
    mutating func validateFields() {
        for (index, field) in formFields.enumerated() {
            processFormField(formField: field, index: index)
        }
        
        if areAllFieldsValid() {
            areAllInputsValid = true
            processPasswordMatching()
        } else {
            areAllInputsValid = false
        }
    }
    
    func areFieldsValid() -> Bool {
        areAllFieldsValid()
    }
    
    private mutating func processPasswordMatching() {
        let passwords = getPasswordFields()
        if !ValidationService.validateValuesMatching(of: passwords) {
            for (index, field) in formFields.enumerated() {
                if formFields[index].fieldId == .passwordConfirmation {
                    modifyFieldOnInvalidInput(field, by: index)
                }
            }
        }
    }
    
    private mutating func processFormField(formField: TextFieldInput, index: Int) {
        if ValidationService.validate(formField.input, by: formField.fieldId) {
            modifyFieldOnSuccessfullValidation(formField, by: index)
        } else {
            modifyFieldOnInvalidInput(formField, by: index)
        }
    }
    
    private mutating func modifyFieldOnSuccessfullValidation(_ field: TextFieldInput, by index: Int) {
        let sectionLabel = formManager.getSuccessMessage(by: field.fieldId)
        formFields[index].label = sectionLabel
        formFields[index].isValid = true
        formFields[index].isValidated = true
    }
    
    private mutating func modifyFieldOnInvalidInput(_ field: TextFieldInput, by index: Int) {
        let errorMessage = formManager.getErrorMessage(by: field.fieldId)
        formFields[index].label = errorMessage
        formFields[index].isValid = false
        formFields[index].isValidated = true
    }
    
    private func getPasswordFields() -> [TextFieldInput] {
        formFields.filter({ field in field.fieldId == .password || field.fieldId == .passwordConfirmation })
    }
    
    private func areAllFieldsValid() -> Bool {
        formFields.allSatisfy({ field in field.isValid })
    }
}
