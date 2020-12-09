import Foundation

struct ValidationService {
    static func validate(_ input: String, by validationField: TextFieldType) -> Bool {
        let validationRegex = validationField.validationRegex()
        return validatieField(input, with: validationRegex)
    }
    
    static func validateValuesMatching(of textFields: [TextFieldInput]) -> Bool {
        let firstInput = textFields.first!.input
        return textFields.allSatisfy { formField in formField.input == firstInput }
    }
    
    private static func validatieField(_ input: String, with regex: String) -> Bool {
        let validation = NSPredicate(format: "SELF MATCHES %@", regex)
        return validation.evaluate(with: input)
    }
}
