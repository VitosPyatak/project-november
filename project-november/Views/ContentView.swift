import SwiftUI

struct ContentView: View {
    @State private var firstNameInput = EMPTY_STRING
    @State private var currentDisplayContent = EMPTY_STRING
    
    var body: some View {
        VStack {
            HStack {
                TextField(TextFieldPlaceholder.FIST_NAME, text: $firstNameInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: onButtonPressed) {
                    Text(ButtonPlacehoder.SHOW_NAME)
                }.buttonStyle(RoundedColoredButtonStyle())
            }
            
            Text(getDisplayMessage())
            
        }.padding()
    }
    
    private func onButtonPressed() {
        currentDisplayContent = firstNameInput
    }
    
    private func getDisplayMessage() -> String {
        currentDisplayContent.isEmpty ? ErrorMessages.NO_FIRST_NAME : currentDisplayContent
    }
    
    private func test() {
        print("test")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
