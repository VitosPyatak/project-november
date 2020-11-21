import SwiftUI

struct ContentView: View {
    var body: some View {
        Text(getReversedText("Hello, there"))
    }
    
    private func getReversedText(_ text: String) -> String {
        String(text.reversed())
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
