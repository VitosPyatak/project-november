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
                        .keyboardType(getFieldId().keyboardType())
                }
            }
            .autocapitalization(.none)
            .disableAutocorrection(true)

        }
    }
    
    private func getTextFieldPlaceholder() -> String {
        let formFieldType = getFieldId()
        return formFieldType.label()
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

    private func getFieldId() -> TextFieldType {
        textFieldEntry.type.wrappedValue
    }

    private func getColor() -> Color {
        var color: Color = .black
        if textFieldEntry.isValidated.wrappedValue && !isInputValid() {
            color =  .red
        }
        return color
    }

    private func getTextFieldImage() -> String {
        var iconType: SystemIconType
        if textFieldEntry.isValidated.wrappedValue {
            iconType = isInputValid() ? .confirmation : .reject
        } else {
            iconType = .pencil
        }
        return iconType.name()
    }
}
