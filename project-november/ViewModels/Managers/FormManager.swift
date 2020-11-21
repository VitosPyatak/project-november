import Foundation

protocol FormManager {
    func getSuccessMessage(by id: FormFieldId) -> String
    func getErrorMessage(by id: FormFieldId) -> String
}
