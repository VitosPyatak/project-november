import Foundation
import SwiftUI

struct FormModel {
    var formFields: [TextFieldInput]
    
    var areAllInputsValid: Bool = false
    
    init(formFields: [TextFieldInput]) {
        self.formFields = formFields
    }
    
    func getField(by fieldType: TextFieldType) -> TextFieldInput {
        formFields.first(where: { field in field.type == fieldType})!
    }
    
    func getField(by index: Int) -> TextFieldInput {
        formFields[index]
    }
    
    func getLabel(by index: Int) -> String {
        formFields[index].label()
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
                if formFields[index].type == .passwordConfirmation {
                    modifyFieldOnInvalidInput(field, by: index)
                }
            }
        }
    }
    
    private mutating func processFormField(formField: TextFieldInput, index: Int) {
        if ValidationService.validate(formField.input, by: formField.type) {
            modifyFieldOnSuccessfullValidation(formField, by: index)
        } else {
            modifyFieldOnInvalidInput(formField, by: index)
        }
    }
    
    private mutating func modifyFieldOnSuccessfullValidation(_ field: TextFieldInput, by index: Int) {
        formFields[index].isValid = true
        formFields[index].isValidated = true
    }
    
    private mutating func modifyFieldOnInvalidInput(_ field: TextFieldInput, by index: Int) {
        formFields[index].isValid = false
        formFields[index].isValidated = true
    }
    
    private func getPasswordFields() -> [TextFieldInput] {
        formFields.filter({ field in field.type == .password || field.type == .passwordConfirmation })
    }
    
    private func areAllFieldsValid() -> Bool {
        formFields.allSatisfy({ field in field.isValid })
    }
}
