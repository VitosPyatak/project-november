import Foundation

struct RegisterFormManager: FormManager {
    func getSuccessMessage(by id: FormFieldId) -> String {
        RegisterLabels.get(by: id)
    }
    
    func getErrorMessage(by id: FormFieldId) -> String {
        RegisterErrorMessages.get(by: id)
    }
}
