import Foundation

struct ValidationService {
    static func validate(_ input: String, by validationField: FormFieldId) -> Bool {
        let validationRegex = InputRegex.get(by: validationField)
        return validatieField(input, with: validationRegex)
    }
    
    static func validateValuesMatching(of textFields: [TextFieldInput]) -> Bool {
        let firstInput = textFields.first!.input
        return textFields.allSatisfy { formField in formField.input == firstInput }
    }
    
    private static func validatieField(_ input: String, with regex: String) -> Bool {
        let validation = NSPredicate(format: RegexFormats.selfMatches, regex)
        return validation.evaluate(with: input)
    }
}
