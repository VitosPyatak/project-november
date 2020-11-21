import Foundation

protocol FormConfig {
    func get(by: FormFieldId) -> String
}
