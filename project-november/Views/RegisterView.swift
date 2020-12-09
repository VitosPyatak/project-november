import SwiftUI
import Foundation

struct RegisterView: View {
    @ObservedObject var viewModel = RegisterFormViewModel()
    
    var body: some View {
        Form {
            ForEach(viewModel.fields.indices) { fieldIndex in
                FormTextField(getTextFieldBinding(by: fieldIndex))
            }
            
            Button(action: onCreateButtonPressed) {
                Text(ButtonPlacehoder.createUser)
            }
        }
        .navigationTitle(NavigationTitles.createUser)
    }
    
    private func onCreateButtonPressed() {
        viewModel.validateFields()
        if viewModel.areAllFieldsValid() {
            UserService.save(from: viewModel.fields)
        }
    }
    
    private func getTextFieldBinding(by index: Int) -> Binding<TextFieldInput> {
        $viewModel.fields[index]
    }
}
