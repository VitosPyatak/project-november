import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = RegisterFormViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                ForEach(viewModel.fields.indices) { fieldIndex in
                    FormTextField(getTextFieldBinding(by: fieldIndex))
                }
                
                Button(action: onCreateButtonPressed) {
                    Text(ButtonPlacehoder.CREATE_USER)
                }
                
                NavigationLink(destination: UsersListView()) {
                    Button(action: {}) {
                        Text(ButtonPlacehoder.USERS_LIST)
                    }
                }
            }
            .navigationTitle(NavigationTitles.CREATE_USER)
        }
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
