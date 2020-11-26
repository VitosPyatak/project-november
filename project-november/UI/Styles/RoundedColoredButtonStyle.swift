import Foundation
import SwiftUI

struct RoundedColoredButtonStyle: ButtonStyle {
    private var backgroundColor: Color?
    
    private let cornerRadius: CGFloat = 15.0
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(.white)
            .background(getBackgroundColor())
            .cornerRadius(cornerRadius)
            
    }
    
    private func getBackgroundColor() -> Color {
        if let color = backgroundColor {
            return color
        }
        return .blue
    }
}
