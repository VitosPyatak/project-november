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
            }
            .navigationTitle(NavigationTitles.CREATE_USER)
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
