import SwiftUI

struct FormTextField: View {
    private var textFieldEntry: Binding<TextFieldInput>
    
    private let defaultOpacity = 0.5
    
    init(_ textFieldEntry: Binding<TextFieldInput>) {
        self.textFieldEntry = textFieldEntry
    }
    
    var body: some View {
        Section(header: getSectionTextHeader()) {
            HStack {
                Image(systemName: getTextFieldImage())
                    .foregroundColor(.blue)
                    .opacity(defaultOpacity)
                    .foregroundColor(getColor())
                    

                if isFieldSecured() {
                    SecureField(getTextFieldPlaceholder(), text: textFieldEntry.input)
                } else {
                    TextField(getTextFieldPlaceholder(), text: textFieldEntry.input)
                        .keyboardType(KeyboardTypes.get(getFieldId()))
                }
            }
            .autocapitalization(.none)
            .disableAutocorrection(true)

        }
    }
    
    private func getTextFieldPlaceholder() -> String {
        let formFieldId = getFieldId()
        return RegisterLabels.get(by: formFieldId)
    }
    
    private func getSectionTextHeader() -> Text {
        Text(textFieldEntry.label.wrappedValue)
            .foregroundColor(getColor())
    }
    
    private func isInputValid() -> Bool {
        textFieldEntry.isValid.wrappedValue
    }

    private func isFieldSecured() -> Bool {
        textFieldEntry.isSecured.wrappedValue
    }

    private func getFieldId() -> FormFieldId {
        textFieldEntry.fieldId.wrappedValue
    }

    private func getColor() -> Color {
        var color: Color = .black
        if textFieldEntry.isValidated.wrappedValue && !isInputValid() {
            color =  .red
        }
        return color
    }

    private func getTextFieldImage() -> String {
        var iconImage: SysIcon
        if textFieldEntry.isValidated.wrappedValue {
            iconImage = isInputValid() ? .confirmation : .reject
        } else {
            iconImage = .pencil
        }
        return SystemIcons.get(iconImage)
    }
}
