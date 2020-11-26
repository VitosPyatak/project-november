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
                    Text(ButtonPlacehoder.createUser)
                }
            }
            .navigationTitle(NavigationTitles.createUser)
        }
    }
    
    private func onCreateButtonPressed() {
        viewModel.validateFields()
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
