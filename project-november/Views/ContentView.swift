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
                
                NavigationLink(destination: UsersListView()) {
                    Button(action: {}) {
                        Text(ButtonPlacehoder.usersList)
                    }
                }
                
                NavigationLink(destination: PhotosView()) {
                    Button(action: {}) {
                        Text(ButtonPlacehoder.PHOTOS_LIST)
                    }
                }
            }
            .navigationTitle(NavigationTitles.createUser)
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
