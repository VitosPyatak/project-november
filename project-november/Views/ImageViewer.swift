import SwiftUI

struct ImageViewer: View {
    private var imageUrl: String
    
    init(_ imageUrl: String) {
        self.imageUrl = imageUrl
    }
    
    var body: some View {
        RemoteImageView(imageUrl)
    }
}
