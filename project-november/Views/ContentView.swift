import SwiftUI

struct ContentView: View {
    @State private var firstNameInput = Strings.empty
    @State private var currentDisplayContent = Strings.empty
    
    var body: some View {
        VStack {
            HStack {
                TextField(TextFieldPlaceholder.firstName, text: $firstNameInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: onButtonPressed) {
                    Text(ButtonPlacehoder.showName)
                }.buttonStyle(RoundedColoredButtonStyle())
            }
            
            Text(getDisplayMessage())
            
        }.padding()
    }
    
    private func onButtonPressed() {
        currentDisplayContent = firstNameInput
    }
    
    private func getDisplayMessage() -> String {
        currentDisplayContent.isEmpty ? ErrorMessages.noFirstName : currentDisplayContent
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
